var inrToUsd = (value) => {
  return "₹" + value + " to USD is " + "$" + value * 0.012;
};

var usdToInr = (value) => {
  return "$" + value + " to INR is " + "₹" + value * 80;
};

module.exports = { inrToUsd, usdToInr };
