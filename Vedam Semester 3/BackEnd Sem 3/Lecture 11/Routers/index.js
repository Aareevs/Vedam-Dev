let express = require("express");
let mongoose = require("mongoose");
let app = express();

let signUpRouter = require("./SignUp");
let loginRouter = require("./Login");
let adminRouter = require("./Admin");
let passwordRouter = require("./Password");

app.use(express.json());

app.use("/signup", signUpRouter);
app.use("/login", loginRouter);
app.use("/", adminRouter);
app.use("/", passwordRouter);

mongoose
    .connect("mongodb://127.0.0.1:27017/db")
    .then(() => {
        console.log("MongoDB connected successfully");
    })
    .catch((err) => {
        console.log("MongoDB connection error:", err);
    });

app.listen(4000, () => {
    console.log("Server is running on port 4000");
});