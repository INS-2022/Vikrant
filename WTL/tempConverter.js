const celToFar = (temp) => {
  console.log(
    temp + "°C to Fahrenheit is " + Math.trunc(temp * (9 / 5) + 32) + " °F."
  );
};
const farToCel = (temp) => {
  console.log(
    temp + "°F to Fahrenheit is " + Math.trunc((temp - 32) * (5 / 9)) + " °C."
  );
};

module.exports = { celToFar, farToCel };
