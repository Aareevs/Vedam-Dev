let express = require("express");
let bcryptjs = require("bcryptjs");

let User = require("../Models/User");

let router = express.Router();

router.post("/", (req, res) => {
    res.send("Signup API is working");
});

module.exports = router;