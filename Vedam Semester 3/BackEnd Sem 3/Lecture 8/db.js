let mongoose = require("mongoose")

let UserSchema = new mongoose.Schema({
    name: String,
    email: String,
    password: String,
    role:{
        type: String,
        enum: ["user", 'admin'],
        default: "user"
    }
})

let User = mongoose.model("user", UserSchema)

module.exports = User