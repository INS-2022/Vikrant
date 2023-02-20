var events = require("events");
var eventEmitter = new events.EventEmitter();

var bubbleSort = () => {
  var arrayNum = [9, 1, 4, 2, 3, 5, 7, 6];
  for (i = 0; i < arrayNum.length; i++) {
    for (j = 0; j < arrayNum.length; j++) {
      if (arrayNum[j] > arrayNum[j + 1]) {
        var temp = arrayNum[j];
        arrayNum[j] = arrayNum[j + 1];
        arrayNum[j + 1] = temp;
      }
    }
  }
  console.log(arrayNum);
};

eventEmitter.on("Sort", bubbleSort);
eventEmitter.emit("Sort");
