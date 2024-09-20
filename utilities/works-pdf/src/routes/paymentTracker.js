var express = require("express");
var router = express.Router();
var url = require("url");
var config = require("../config");

var { search_projectDetails, create_pdf, search_localization, search_payment_instruction, search_report_paymentTracker} = require("../api");
const { asyncMiddleware } = require("../utils/asyncMiddleware");
const { getLanguageFromRequest, getStateLocalizationModule, getCityLocalizationModule, getStateLocalizationPrefix, getCityLocalizationPrefix, getLocalizationByKey } = require("../utils/localization");

function renderError(res, errorMessage, errorCode) {
    if (errorCode == undefined) errorCode = 500;
    res.status(errorCode).send({ errorMessage })

}

function getCurrentDate() {
    const today = new Date();
  
    // Get the components of the date
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // Months are zero-based
    const year = today.getFullYear();
  
    // Format the date as "dd-mm-yyyy"
    const formattedDate = `${day}/${month}/${year}`;
  
    return formattedDate;
  }

// async function getStateCityLocalizaitons(request, tenantId) {
//     let localizationMaps = {};
//     let lang = getLanguageFromRequest(request);
//     let modules = [getStateLocalizationModule(tenantId),getCityLocalizationModule(tenantId)].join(",");
//     let localRequest = {}
//     localRequest["RequestInfo"] = request["RequestInfo"];
//     let localizations = await search_localization(localRequest, lang, modules, tenantId);
//     if (localizations?.data?.messages?.length) {
//         localizations.data.messages.forEach(localObj => {
//             localizationMaps[localObj.code] = localObj.message;
//         });
//     }
//     return localizationMaps;
// }

// function updateLocalization(projects, localizationMaps, tenantId) {
//     projects = projects.map((project) => {
//         if (project?.address?.latitude != null && project?.address?.latitude != 0 && project?.address?.longitude != null  && project?.address?.longitude != 0) {
//             project.address.pdfLatlong = `${project.address.latitude}, ${project.address.longitude}`;
//         } else {
//             project.address.pdfLatlong = null;
//         }
//         if (project?.address?.city) {
//             project.address.city = project.address.city.toUpperCase();
//             cityKey = "TENANT_TENANTS_" + project.address.city.split(".").join("_");
//             project.address.city = getLocalizationByKey(cityKey, localizationMaps);
//         }
//         if (project?.additionalDetails?.locality) {
//             let localityKey = getCityLocalizationPrefix(tenantId);
//             localityKey = localityKey + "_ADMIN_" + project.additionalDetails.locality;
//             project.additionalDetails.locality = getLocalizationByKey(localityKey, localizationMaps);
//         }
//         if (project?.address?.boundary) {
//             let boundaryKey = getCityLocalizationPrefix(tenantId);
//             boundaryKey = boundaryKey + "_ADMIN_" + project.address.boundary;
//             project.address.boundary = getLocalizationByKey(boundaryKey, localizationMaps);
//         }
//         return project;
//     })
//     return projects;
// }

router.post(
    "/payment-tracker",
    asyncMiddleware(async function (req, res, next) {
        var tenantId = req.query.tenantId;
        var projectNum = req.query.projectId;
        var requestinfo = req.body;
        if (requestinfo == undefined) {
            return renderError(res, "requestinfo can not be null", 400)
        }
        if (!tenantId) {
            return renderError(res, "tenantId is mandatory to generate the receipt", 400)
        }
        if (!projectNum) {
            return renderError(res, "projectId is mandatory to generate the receipt", 400)
        }
        try {
            try {
                resProject = await search_projectDetails(tenantId, requestinfo, projectNum);
            }
            catch (ex) {
                if (ex.response && ex.response.data) console.log(ex.response.data);
                return renderError(res, "Failed to query details of the project", 500);
            }

            RequestInfo = requestinfo.RequestInfo;

            var ward = "string";

            try {
                resHeadWiseData = await search_report_paymentTracker(tenantId, RequestInfo, ward);
            }
            catch (ex) {
                if (ex.response && ex.response.data) console.log(ex.response.data);
                return renderError(res, "Failed to query details of the report", 500);
            }
            var headWiseData = resHeadWiseData.data;

            var piType = "ORIGINAL";
            try {
                resPaymentInstruction = await search_payment_instruction(tenantId, RequestInfo, piType);
            }
            catch (ex) {
                if (ex.response && ex.response.data) console.log(ex.response.data);
                return renderError(res, "Failed to query details of the payment instruction", 500);
            }

            var paymentInstruction = resPaymentInstruction.data;


            var project = resProject.data;
            if (project && project.Project && project.Project.length > 0) {
                    var pdfResponse;
                    var pdfkey = config.pdf.paymentTracker_template;
                    
                    // let localizationMap = await getStateCityLocalizaitons(requestinfo, tenantId);
                    // project.Project = updateLocalization(project.Project, localizationMap, tenantId);
                    // Adding project as Projects because it's updating on create_pdf
                    project["Projects"] = project.Project;
                    project["Projects"][0]["date"] = getCurrentDate(); 
                    project["Projects"][0]["bills"] = paymentInstruction.items;
                    project["Projects"][0]["headWiseData"] = headWiseData.aggsResponse.projects[0];

                    try {
                        pdfResponse = await create_pdf(
                            tenantId,
                            pdfkey,
                            project,
                            requestinfo
                        )
                    }
                    catch (ex) {
                        if (ex.response && ex.response.data) console.log(ex.response.data);
                        return renderError(res, "Failed to generate PDF for project details", 500);
                    }

                    var filename = `${pdfkey}_${new Date().getTime()}`;

                    //pdfData = pdfResponse.data.read();
                    res.writeHead(200, {
                        "Content-Type": "application/pdf",
                        "Content-Disposition": `attachment; filename=${filename}.pdf`,
                    });
                    pdfResponse.data.pipe(res);
                }
                else {
                    return renderError(
                        res,
                        "There is no project created using this project number",
                        404
                    );
                }
            } catch (ex) {
                return renderError(res, "Failed to query details of the project", 500);
            }

        })

);

module.exports = router;