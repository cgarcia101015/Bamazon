var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",


// Your port; if not 3306
port: 3306,

// You username
user: "root",

// Your password
password: "SQL*TESTPW"
})

connection.connect(function(err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId + "\n");
});

// Displays all products
