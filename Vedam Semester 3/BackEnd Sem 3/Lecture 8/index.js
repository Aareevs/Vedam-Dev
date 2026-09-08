let express = require("express");
let mongoose = require("mongoose");
let bcryptjs = require("bcryptjs");
let cors = require("cors");
let jwt = require("jsonwebtoken");

let app = express();

let User = require("./db.js");

app.use(express.json());
app.use(cors());


// DATABASE CONNECTION

mongoose
  .connect("mongodb://127.0.0.1:27017/db")
  .then(() => {
    console.log("db......");
  })
  .catch((err) => {
    console.log(err);
  });


// SIGNUP

app.post("/signUp", async (req, res) => {

  let { name, email, password, role } = req.body;

  let findData = await User.findOne({ email });

  console.log(findData, "findData");

  if (findData) {
    return res.send("user already exists");
  }

  let updatedPassword = await bcryptjs.hash(password, 10);

  let UserInfo = new User({
    name,
    email,
    password: updatedPassword,
    role: role || "user",
  });

  await UserInfo.save();

  res.send("Signup successful");
});


// LOGIN

app.post("/login", async (req, res) => {

  let { email, password } = req.body;

  let findData = await User.findOne({ email });

  console.log(findData, "findData");

  if (!findData) {
    return res.send("User not found");
  }

  let validPassword = await bcryptjs.compare(
    password,
    findData.password
  );

  if (!validPassword) {
    return res.send("Invalid password");
  }

  let token = jwt.sign(
    {
      email: findData.email,
      role: findData.role,
    },
    "hehehehehe",
    {
      expiresIn: "1h",
    }
  );

  console.log(token, "token");

  res.json({
    msg: "Login successful",
    token: token,
  });
});


// AUTH MIDDLEWARE

let auth = (req, res, next) => {

  let authHeader = req.headers.authorization;

  console.log(authHeader, "authorization");

  if (!authHeader) {
    return res.status(401).send("Token not found");
  }

  let token = authHeader.startsWith("Bearer ")
    ? authHeader.split(" ")[1]
    : authHeader;

  try {

    let decode = jwt.verify(token, "hehehehehe");

    console.log(decode, "decoded");

    req.user = decode;

    next();

  } catch (err) {

    console.log(err.message);

    return res.status(401).send("Invalid or expired token");
  }
};

let roleCheck = (role)=>{
    return (req,res,next)=>{
        if(req.user.role !== role){
            console.log(req.user.role,"role");
            return res.status(403).send("Access denied");
        }
        next();
    }
}


// PROTECTED ROUTE

// app.get("/api", auth, roleCheck("admin"), (req, res) => {

//   console.log(req.user);

//   res.send({
//     message: "You can access this API",
//     user: req.user,
//   });
// });


app.get(
    "/api",
    auth,
    roleCheck("admin"),
    (req, res) => {

        console.log(req.user);

        res.send({
            message: "You can access this API",
            user: req.user
        });
    }
);

app.listen(3000, () => {
  console.log("server......");
});