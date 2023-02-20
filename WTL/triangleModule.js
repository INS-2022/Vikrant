const checkTriangle = (x, y, z) => {
  if (x == y && y == z) {
    console.log("It is an equilateral triangle");
    area(x, y, z);
  } else if (x == y || y == z || x == z) {
    console.log("It is an isosceles triangle");
    area(x, y, z);
  } else {
    console.log("It is a scalene triangle");
    area(x, y, z);
  }
};

const area = (x, y, z) => {
  var s = (x + y + z) / 2;
  console.log(s);
  var a = Math.sqrt(s * (s - x) * (s - y) * (s - z));
  console.log(a);
  console.log("Area is: " + a);
};

module.exports = { checkTriangle, area };
