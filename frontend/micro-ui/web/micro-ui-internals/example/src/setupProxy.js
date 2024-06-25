const { createProxyMiddleware } = require("http-proxy-middleware");

const createProxy = createProxyMiddleware({
  //target: process.env.REACT_APP_PROXY_API || "https://uat.digit.org",
  // target: process.env.REACT_APP_PROXY_API || "https://qa.digit.org",
  target: process.env.REACT_APP_PROXY_API || "https://works-dev.digit.org",
  changeOrigin: true,
  secure: false,
});
const assetsProxy = createProxyMiddleware({
  target: process.env.REACT_APP_PROXY_ASSETS || "https://works-dev.digit.org",
  changeOrigin: true,
  secure: false,
});

module.exports = function (app) {
  [
    "/access/v1/actions/mdms",
    "/egov-mdms-service",
    "/egov-location",
    "/localization",
    "/egov-workflow-v2",
    "/pgr-services",
    "/filestore",
    "/mukta-egov-hrms",
    "/mukta-user-otp",
    "/user",
    "/fsm",
    "/billing-service",
    "/collection-services",
    "/pdf-service",
    "/pg-service",
    "/vehicle",
    "/vendor",
    "/property-services",
    "/fsm-calculator/v1/billingSlab/_search",
    "/pt-calculator-v2",
    "/dashboard-analytics",
    "/echallan-services",
    "/egov-searcher/bill-genie/mcollectbills/_get",
    "/egov-searcher/bill-genie/billswithaddranduser/_get",
    "/egov-searcher/bill-genie/waterbills/_get",
    "/egov-searcher/bill-genie/seweragebills/_get",
    "/egov-pdf/download/UC/mcollect-challan",
    "/mukta-egov-hrms/employees/_count",
    "/tl-services/v1/_create",
    "/tl-services/v1/_search",
    "/egov-url-shortening/shortener",
    "/inbox/v1/_search",
    "/tl-services",
    "/tl-calculator",
    "/edcr",
    "/bpa-services",
    "/noc-services",
    "/egov-user-event",
    "/egov-document-uploader",
    "/egov-pdf",
    "/egov-survey-services",
    "/ws-services",
    "/sw-services",
    "/ws-calculator",
    "/sw-calculator/",
    "/egov-searcher",
    "/report",
    "/inbox/v1/dss/_search",
    "/loi-service",
    "/mukta-estimate",
    "/mukta-contract",
    "/loi-service",
    "/works-inbox-service/v2/_search",
    "/egov-pdf/download/WORKSESTIMATE/estimatepdf",
    "/muster-roll",
    "/project",
    "/inbox/v2/_search",
    "/mukta-individual",
    "/org-services",
    "/wms/mukta-contract/_search",
    "/org-services/organisation/v1/_search",
    "/expensebilling",
    "/bankaccount-service",
    "/wms",
    "/ifms",
    "/wms/mukta-estimate/_search",
    "/mukta-expense-calculator/v1/_estimate",
    "/mukta-expense/bill",
    "/mukta-expense-calculator/purchase/v1/_createbill",
    "/mukta-expense/bill/v1",
    "/egov-pdf/bill/_search",
    "/mukta-expense-calculator/v1/_search",
    "/mukta-expense/payment/",
    "/mukta-expense-calculator/",
    "/measurement-service/",
    "/mukta-mukta-services/",
    "/mdms-v2/",
    "/egov-idgen/",
    "/rate-analysis/v1/_calculate",
    "mukta-ifix-adapter",
    "/ifms-adapter",
    "/rate-analysis/v1/scheduler/_search",
    "/mdms-v2/v2/_search",
    "/rate-analysis/v1/scheduler/_create"
  ].forEach((location) => app.use(location, createProxy));
  ["/pb-egov-assets"].forEach((location) => app.use(location, assetsProxy));
};
