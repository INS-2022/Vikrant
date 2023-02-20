var http = require("http");
var fs = require("fs");

const serveVideo = (req, resp) => {
  resp.writeHead(200, { "content-Type": "video/mp4" });
  var video = fs.createReadStream("sky.mp4");
  video.pipe(resp);
  // resp.end();
};

try {
  http.createServer(serveVideo).listen(8000);
  console.log("Server running");
} catch (error) {
  console.log(error);
}
