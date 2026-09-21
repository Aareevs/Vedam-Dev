let mongoose = require("mongoose");

let userSchema = new mongoose.Schema({

    name: {
        type: String,
        required: true
    },

    email: {
        type: String,
        required: true,
        unique: true
    },

    password: {
        type: String,
        required: true
    },

    role: {
        type: String,
        default: "user"
    },

    resetPasswordToken: {
        type: String
    },

    resetPasswordExpires: {
        type: Date
    }

});

let User = mongoose.model("User", userSchema);

module.exports = User;