let express = require("express");
let auth = require("./Auth");
let router = express.Router();

router.get("/api", auth, (req, res) => {

    res.send({
        message: "API is working",
        user: req.user
    });

});

module.exports = router;