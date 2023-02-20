var http = require("http");
var fs = require("fs");

const serveHTML = (req, resp) => {
  resp.writeHead(200, { "Content-Type": "text/html" });
  fs.readFile("index.html", (err, data) => {
    if (err) throw err;
    resp.write(data);
    resp.end();
  });
};

const serveCSV = (req, resp) => {
  resp.writeHead(
    200,
    { "Content-Type": "text/csv" },
    "Content-Disposition",
    "attachment;filename=addresses.csv"
  );
  fs.readFile("addresses.csv", (err, data) => {
    if (err) throw err;
    resp.write(data);
    resp.end();
  });
};

try {
  http.createServer(serveCSV).listen(8000);
  console.log("Server running!");
} catch (error) {
  console.log("Port not available.");
}
