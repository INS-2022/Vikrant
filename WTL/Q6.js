var events = require("events");
var eventEmitter = new events.EventEmitter();

const sumOdd = () => {
  var intArr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var sum = 0;
  for (i = 0; i < intArr.length; i++) {
    if (intArr[i] % 2 != 0) {
      sum += intArr[i];
    }
  }
  console.log(sum);
};

const sumEven = () => {
  var intArr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var sum = 0;
  for (i = 0; i < intArr.length; i++) {
    if (intArr[i] % 2 == 0) {
      sum += intArr[i];
    }
  }
  console.log(sum);
};

eventEmitter.on("odd", sumOdd);
eventEmitter.on("even", sumEven);

eventEmitter.emit("odd");
eventEmitter.emit("even");
