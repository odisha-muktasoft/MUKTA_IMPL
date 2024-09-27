export const sortedFIlteredData = (list, type) => {
  // Function to create the array of objects based on the requirement

  let resultArray = [];

  resultArray = list.filter((item) => item.type === type);

  return resultArray;
};

var multiply = function(num1, num2) {
  if (num1 === '0' || num2 === '0') return '0';

  const m = num1.length, n = num2.length, res = new Array(m + n).fill(0);

  for (let i = m - 1; i >= 0; i--) {
    for (let j = n - 1; j >= 0; j--) {
      const p1 = i + j, p2 = i + j + 1;
      let sum = res[p2] + Number(num1[i]) * Number(num2[j]);
      res[p2] = sum % 10;
      res[p1] += Math.floor(sum / 10);
    }
  }
  while (res[0] === 0) res.shift(); // Remove leading zeros
  return res.length ? res.join('') : '0';
};

const multiplyWithDecimals = (v1, v2) => {
  const getDecimalPlaces = num => (num.includes('.') ? num.split('.')[1].length : 0);
  
  const d1 = getDecimalPlaces(v1);
  const d2 = getDecimalPlaces(v2);
  
  // Remove decimals from both numbers
  const num1 = v1.replace('.', '');
  const num2 = v2.replace('.', '');
  
  // Multiply as whole numbers
  let result = multiply(num1, num2);
  
  // Insert decimal point at the correct place
  const totalDecimals = d1 + d2;
  if (totalDecimals > 0) {
    const pointPos = result.length - totalDecimals;
    result = result.padStart(totalDecimals + 1, '0'); // Ensure result has enough length
    result = result.slice(0, pointPos) + '.' + result.slice(pointPos);
  }

  return result;
};

const roundToPrecisionForString = (value, precision) => {
  // Split the value into integer and decimal parts
  let [integerPart, decimalPart = ''] = value.split('.');

  // If no decimal part or precision is 0, return the integer part
  if (precision === 0 || decimalPart === '') {
    return integerPart;
  }

  // If the decimal part is shorter than the desired precision, return it as is
  if (decimalPart.length <= precision) {
    return value;
  }

  if (decimalPart[precision] >= 5) {
    decimalPart = decimalPart.slice(0, precision);
    if (decimalPart === '9'.repeat(precision)) {
      value = String(parseFloat(integerPart) + 1);
    } else {
      decimalPart = String(Number(decimalPart) + 1);
      value = integerPart + '.' + decimalPart;
    }
  } else {
    value = integerPart + '.' + decimalPart.slice(0, precision);
  }
  return value;
}

export const multiplyFourWithFourPointerPrecision = (v1, v2, v3, v4) => {
  v1 = String(v1);
  v2 = String(v2);
  v3 = String(v3);
  v4 = String(v4);

  let result = multiplyWithDecimals(v1, v2);
  result = multiplyWithDecimals(result, v3);
  result = multiplyWithDecimals(result, v4);
  // console.log("raw", result);
  const totalDecimalsInResult = result.includes('.') ? result.split('.')[1].length : 0
  if (totalDecimalsInResult > 4) {
    result = roundToPrecisionForString(result, 4);
  }
  // console.log("adjusted", result);
  return parseFloat(result);
}
