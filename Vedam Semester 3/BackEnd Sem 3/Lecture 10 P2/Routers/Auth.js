let jwt = require("jsonwebtoken");
let auth = (req, res, next) => {

    try {

        let authHeader = req.headers.authorization;

        if (!authHeader) {
            return res.status(401).send("Token not found");
        }

        let token = authHeader.split(" ")[1];

        if (!token) {
            return res.status(401).send("Token not found");
        }

        let decoded = jwt.verify(token, "secretkey");

        req.user = decoded;

        next();

    } catch (error) {

        console.log("JWT error:", error.message);

        return res.status(401).send("Invalid token");
    }
};

module.exports = auth;