export const getDefaultValues = (sordata, t, mbNumber) => {
    //default values to show the data in create rate analysis screen
    let SORData = {
        "SORCode" : sordata?.uniqueIdentifier,
        "SORType" : t(`SOR_TYPE_${sordata?.data?.sorType}`),
        "SORSubType" : t(`SOR_SUBTYPE_${sordata?.data?.sorSubType}`),
        "SORVarient" : t(`SOR_VARIENT_${sordata?.data?.sorVariant}`),
        "uom" : t(`COMMON_MASTERS_UOM_${sordata?.data?.uom}`),
        "rateDefinedForQty" : sordata?.data?.quantity,
        "description" : sordata?.data?.description,
        "status": sordata?.isActive ? "Active" : "InActive"
     }
    return {SORData };
  };

  export const deepCompare = (obj1, obj2) => {
    if (obj1 === obj2) return false; // Identical references or values
    if (typeof obj1 !== 'object' || typeof obj2 !== 'object' || obj1 === null || obj2 === null) return true; // Different types or one is null
  
    const keys1 = Object.keys(obj1);
    const keys2 = Object.keys(obj2);
  
    for (let key of keys1) {
      if (!keys2.includes(key) || deepCompare(obj1[key], obj2[key])) return true; // Key missing or values differ
    }
  
    return false; // No differences found
  }