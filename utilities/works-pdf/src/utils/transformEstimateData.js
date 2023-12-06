
const transformEstimateData = (lineItems, contract, measurement, allMeasurements, estimateDetails) => {


    var idEstimateDetailsMap = {};
    for (let i = 0; i < estimateDetails.length; i++) {
      if(estimateDetails[i].category=="OVERHEAD"){
        continue;
      }
      if(estimateDetails[i].sorId==null){
        if(idEstimateDetailsMap["null"]){
          var updatedArray=idEstimateDetailsMap["null"]
          updatedArray.push(estimateDetails[i])
          idEstimateDetailsMap["null"]=updatedArray
        }
        else{
          idEstimateDetailsMap["null"]=[estimateDetails[i]]
        }
      }
      else{
        if(idEstimateDetailsMap[estimateDetails[i].sorId]){
          var updatedArray=idEstimateDetailsMap[estimateDetails[i].sorId]
          updatedArray.push(estimateDetails[i])
          idEstimateDetailsMap[estimateDetails[i].sorId]=updatedArray
        }
        else{
          idEstimateDetailsMap[estimateDetails[i].sorId]=[estimateDetails[i]]
        }
      }
    }
    var sorIdMeasuresMap = {};
    // iterate over idEstimateDetailsMap and from idEstimateDetailsMap[sorId] we will get array of estimateDetails and then get id of each estimateDetails and then match that id with estimateLineItemId of lineItems and get contractLineItemId and then match that contractLineItemId with targetId of measurement and get measures
    for (let i = 0; i < Object.keys(idEstimateDetailsMap).length; i++) {
      var sorId = Object.keys(idEstimateDetailsMap)[i];
      var estimateDetailsArray = idEstimateDetailsMap[sorId];

      var description = estimateDetailsArray[0].name;
      var uom = estimateDetailsArray[0].uom;
      var unitRate = estimateDetailsArray[0].unitRate;
      var quantity = estimateDetailsArray[0].quantity;
    

      var sorIdMeasuresMapKey = {
        sorId: sorId,
        description: description,
        uom: uom,
        unitRate: unitRate,
        quantity: quantity
      };
      
      // here loop over estimateDetailsArray and get estimateLineItemId and then match that estimateLineItemId with estimateLineItemId of lineItems and get contractLineItemId and then match that contractLineItemId with targetId of measurement and get measures
      var measures = [];
      for (let j = 0; j < estimateDetailsArray.length; j++) {
        var estimateLineItemId = estimateDetailsArray[j].id;
        var contractLineItemId = lineItems.find((e) => e.estimateLineItemId == estimateLineItemId).contractLineItemRef;
        var targetId = measurement.measures.find((e) => e.targetId == contractLineItemId).id;
        measures.push(measurement.measures.find((e) => e.id == targetId));
        
        if(estimateDetailsArray[j].isDeduction){
          measures[j].type = "Minus";
        }
        else{
          measures[j].isDeduction = "Plus";
        }
      }
      
      // i want to have sorIdMeasuresMapKey as key and measures as value
      sorIdMeasuresMapKey = {
        ...sorIdMeasuresMapKey,
        measures: measures
      }


      sorIdMeasuresMap[sorId] = sorIdMeasuresMapKey;
    }
    return sorIdMeasuresMap;
  };

  module.exports = {
    transformEstimateData
    };