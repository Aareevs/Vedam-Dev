let express = require("express");
let bcryptjs = require("bcryptjs");
let jwt = require("jsonwebtoken");

let User = require("../Models/User");

let router = express.Router();

router.post("/", (req, res) => {
    res.send("Login API is working");
});

module.exports = router;