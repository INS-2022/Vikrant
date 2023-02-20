var setIntervalObj = setInterval(() => {
  console.log("Hello");
}, 500);

setTimeout(() => {
  clearInterval(setIntervalObj);
}, 2500);

console.log("Hello will be printed 4 times.");
