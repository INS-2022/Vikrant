var http = require("http");
var fs = require("fs");

const serveVideo = (req, resp) => {
  resp.writeHead(200, { "content-Type": "video/mp4" });
  var video = fs.createReadStream("https://ik.imagekit.io/PaxyifierProjTest32/Untitled_cYpP2Bvja.mp4?ik-sdk-version=javascript-1.4.3&updatedAt=1676902575072");
  video.pipe(resp);
  // resp.end();
};

try {
  http.createServer(serveVideo).listen(8000);
  console.log("Server running");
} catch (error) {
  console.log(error);
}
