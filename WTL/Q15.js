var areaModule = require("./triangleModule");
var rs = require("readline-sync");

console.log("Enter sides of a triangle.");

var x = parseInt(rs.question("Side 1: "));
var y = parseInt(rs.question("Side 2: "));
var z = parseInt(rs.question("Side 3: "));

areaModule.checkTriangle(x, y, z);
