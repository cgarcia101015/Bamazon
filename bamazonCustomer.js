var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",


// Your port; if not 3306
port: 3306,

// You username
user: "root",

// Your password
password: "SQL*TESTPW",
database: "bamazon"
})

// Connect to the mysql server and sql database
connection.connect(function(err) {
    if (err) throw err;
    // run the start function after the connection is made to prompt the user
    displayProducts();
    
});

// Displays all products
function displayProducts() {
    console.log("Displaying all products...\n");
    connection.query("SELECT * FROM products", function(err, res) {
        if (err) throw err;

        for(var i=0; i<res.length; i++) {
            console.log(res[i].item_id + ". " + res[i].product_name + " || " + res[i].department_name + " || " + "Price: $" + res[i].price + " || " +
            "Amount in Stock: " + res[i].stock_quantity + "\n");
        }
        userPurchase();       
    });
}

// Asks the user two questions
function userPurchase() {
    inquirer
      .prompt([
    {
          name: "id",
          type: "input",
          message: "\nWhat's the item ID of the product you would like to buy? ",
          filter: Number
    },
    {
          name: "quantity",
          type: "input",
          message: "How many items do you wish to buy? ",
          filter: Number
    },

]).then(function(answer) {
        var selectedID = answer.id;
        var numberOfItems = answer.quantity;
        console.log(selectedID, numberOfItems);
        calcPurchase(selectedID, numberOfItems);
    });
};

// Processes the users order
function calcPurchase(ID, quantity) {
    connection.query("SELECT * FROM products WHERE item_id = " + ID, function(err,res) {
        if(err) {console.log(err)};
        if(quantity <= res[0].stock_quantity) {
            var amountSpent = res[0].price * quantity;
            var stockQuantity = res[0].stock_quantity - quantity;

            console.log("Amount spent= $" + amountSpent);
            console.log("Quantity leftover of " + res[0].product_name + " is " + stockQuantity + " units.");
           
            connection.query("UPDATE products SET ? WHERE ?",
            [
                {
                    stock_quantity: stockQuantity
                },
                {
                    item_id: ID
                }
            ],
            
            );
            displayProducts();
        } else {
            console.log("Sorry we don't have enough of that item in stock to complete your order!")
        };
        
    })
}
      
