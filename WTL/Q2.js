var events = require("events");
var eventEmmiter = new events.EventEmitter();

var mySort = () => {
  var stringArr = ["Omkar", "Sree", "Mayur", "Gourav"];
  stringArr.sort();
  console.log(stringArr);
};

eventEmmiter.on("sort", mySort);
eventEmmiter.emit("sort");

var mySearch = () => {
  const stringArr = ["Omkar", "Sree", "Mayur", "Gourav"];
  if (stringArr.includes("Bruh")) {
    console.log("Found at index: " + stringArr.indexOf("Bruh"));
  } else {
    console.log("Not found");
  }
};

eventEmmiter.on("search", mySearch);
eventEmmiter.emit("search");

const test = (a) => {
  console.log(a);
};

eventEmmiter.on("test", test, 2);
eventEmmiter.emit("test");
