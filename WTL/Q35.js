var events = require("events");
var eventEmitter = new events.EventEmitter();
var charArr = ["D", "G", "A", "Z", "K", "M", "J"];

const sortArr = (arr) => {
  arr = arr ? arr : [];
  arr.sort();
  console.log(arr);
};

const searchArr = () => {
  var charArr = ["D", "G", "A", "Z", "K", "M", "J"];
  if (charArr.includes("K")) {
    console.log("Found at position: " + (charArr.indexOf("K") + 1));
  } else {
    console.log("Not found!");
  }
};

eventEmitter.on("sort", sortArr, charArr);
eventEmitter.emit("sort");

eventEmitter.on("search", searchArr);
eventEmitter.emit("search");
