var fs = require("fs");

const createFileFunc = () => {
  fs.writeFile("sample.txt", "Hello World!", (err) => {
    if (err) throw err;
    console.log("File successfully created and written");
  });
};

const writeFileFunc = (msg) => {
  fs.writeFile("sample.txt", msg, (err) => {
    if (err) throw err;
    console.log("File successfully written");
  });
};

const readFileFunc = () => {
  fs.readFile("sample.txt", "utf8", (err, data) => {
    if (err) throw err;
    console.log("File read successfully");
    console.log(data);
  });
};

const deleteFileFunc = () => {
  fs.unlink("sample.txt", (err) => {
    if (err) throw err;
    console.log("File deleted successfully");
  });
};

// createFileFunc();
// writeFileFunc("Hello Vikrant!");
// readFileFunc();
// deleteFileFunc();
