var ms = require("mysql");

var con = ms.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "employee",
});

// Create employee db consisting empid,name,address, salary

con.connect((err) => {
  if (err) throw err;
  console.log("Connected.");

  //   var table =
  //     "CREATE TABLE employee(empid int(2), name varchar(25), address varchar(25), salary int(7));";

  //   con.query(table, (err) => {
  //     if (err) throw err;
  //     console.log("Table Created");
  //   });

  for (i = 2; i <= 10; i++) {
    var insertQuery = `INSERT INTO employee VALUES(${i},'Omkar', 'Kandivali', 1${i}00000);`;

    con.query(insertQuery, (err) => {
      if (err) throw err;
      console.log("Insert values");
    });
  }
});
