export const sortedFIlteredData = (list, type) => {
  // Function to create the array of objects based on the requirement

  let resultArray = [];

  resultArray = list.filter((item) => item.type === type);

  return resultArray;
};
