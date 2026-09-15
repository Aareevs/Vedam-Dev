const express = require("express");
const mongoose = require("mongoose");
const bcryptjs = require("bcryptjs");
const cors = require("cors");
const jwt = require("jsonwebtoken");
const nodemailer = require('nodemailer');
const crypto = require("crypto");

const app = express();

const User = require("./db");

// Middleware
app.use(express.json());
app.use(cors());

// MongoDB connection
mongoose
    .connect("mongodb://127.0.0.1:27017/db")
    .then(() => {
        console.log("MongoDB connected successfully");
    })
    .catch((err) => {
        console.log("MongoDB connection error:", err);
    });

// Test API
app.get("/", (req, res) => {
    res.json({
        message: "Backend connected successfully!"
    });
});

// Signup API
app.post("/signUp", async (req, res) => {
    try {
        const { name, email, password, role } = req.body;

        // Check if all fields are provided
        if (!name || !email || !password) {
            return res.status(400).json({
                message: "Name, email and password are required"
            });
        }

        // Check if user already exists
        const findData = await User.findOne({ email });

        if (findData) {
            return res.status(409).json({
                message: "User already exists"
            });
        }

        // Hash password
        const hashedPassword = await bcryptjs.hash(password, 10);

        // Create user
        const userInfo = new User({
            name: name,
            email: email,
            password: hashedPassword,
            role: role || "user"
        });

        // Save user
        await userInfo.save();

        return res.status(201).json({
            message: "Signup successful"
        });

    } catch (error) {
        console.log("Signup error:", error);

        return res.status(500).json({
            message: "Internal server error"
        });
    }
});

// Login API
app.post("/login", async (req, res) => {
    try {
        let { email, password } = req.body;

        // Check if all fields are provided
        if (!email || !password) {
            return res.status(400).json({
                message: "Email and password are required"
            });
        }

        // Find user
        let findData = await User.findOne({ email });

        if (!findData) {
            return res.status(404).send("User not found");
        }

        // Compare password
        let valid = await bcryptjs.compare(password, findData.password);

        if (!valid) {
            return res.status(401).send("Invalid email or password");
        }

        // Create JWT token
        let token = jwt.sign(
            {
                email: findData.email,
                role: findData.role
            },
            "secretkey",
            {
                expiresIn: "1h"
            }
        );

        console.log(token, "token");

        res.send({
            message: "Login successful",
            token
        });

    } catch (error) {
        console.log("Login error:", error);

        res.status(500).send("Internal server error");
    }
});

// Authentication middleware
let auth = (req, res, next) => {
    try {
        let authHeader = req.headers.authorization;

        console.log(authHeader, "authorization header");

        if (!authHeader) {
            return res.status(401).send("Token not found");
        }

        // Get token from Authorization header
        let token = authHeader.split(" ")[1];

        if (!token) {
            return res.status(401).send("Token not found");
        }

        // Verify token
        let decoded = jwt.verify(token, "secretkey");

        console.log(decoded, "decoded");

        req.user = decoded;

        next();

    } catch (error) {
        console.log("JWT error:", error.message);

        return res.status(401).send("Invalid token");
    }
};

// Role check middleware
let roleCheck = (role) => {
    return (req, res, next) => {

        if (req.user.role !== role) {
            return res.status(403).send("Who the hell are you?");
        }

        // console.log(req.user, "isko dekkho");

        next();
    };
};

// Protected API
app.get("/api", auth, (req, res) => {

    console.log(req.user);

    res.send({
        message: "api is working",
        user: req.user
    });

});

// Admin API
app.get("/admin", auth, roleCheck("admin"), (req, res) => {

    console.log(req.user);

    res.send({
        message: "Admin API is working",
        user: req.user
    });

});

// Forget Password 
app.post("/forgetPassword", async (req, res) => {

    try {

        const { email } = req.body;

        if (!email) {
            return res.status(400).send("Email is required");
        }

        const user = await User.findOne({ email });

        // Don't reveal whether an email exists
        if (!user) {
            return res.status(200).send(
                "If an account exists with this email, a reset link has been sent."
            );
        }

        // Generate random token
        const resetToken = crypto.randomBytes(32).toString("hex");

        // Store token in database
        user.resetPasswordToken = resetToken;

        // Token valid for 15 minutes
        user.resetPasswordExpires = Date.now() + 15 * 60 * 1000;

        await user.save();

        // Your frontend URL
        const resetLink =
    `http://localhost:5174/reset-password?token=${resetToken}`;

        const emailHTML = `
            <div style="font-family: Arial, sans-serif; max-width: 600px; margin: auto;">

                <h2>Password Reset</h2>

                <p>Hello ${user.name},</p>

                <p>
                    We received a request to reset your password.
                </p>

                <p>
                    Click the button below to create a new password:
                </p>

                <a
                    href="${resetLink}"
                    style="
                        display: inline-block;
                        padding: 12px 24px;
                        background-color: #007bff;
                        color: white;
                        text-decoration: none;
                        border-radius: 6px;
                        font-weight: bold;
                    "
                >
                    Reset Password
                </a>

                <p style="margin-top: 25px;">
                    This link will expire in 15 minutes.
                </p>

                <p>
                    If you did not request a password reset, you can safely
                    ignore this email.
                </p>

            </div>
        `;

        await sendEmail(
            email,
            "Reset Your Password",
            emailHTML
        );

        res.status(200).send(
            "If an account exists with this email, a reset link has been sent."
        );

    } catch (error) {

        console.log("Forget password error:", error);

        res.status(500).send("Internal server error");
    }
});

app.post("/resetPassword", async (req, res) => {

    try {

        const { token, newPassword } = req.body;

        if (!token || !newPassword) {
            return res.status(400).send(
                "Token and new password are required"
            );
        }

        // Find user using reset token
        const user = await User.findOne({
            resetPasswordToken: token,
            resetPasswordExpires: { $gt: Date.now() }
        });

        if (!user) {
            return res.status(400).send(
                "Invalid or expired reset link"
            );
        }

        // Hash new password
        const hashedPassword = await bcryptjs.hash(newPassword, 10);

        user.password = hashedPassword;

        // Delete reset token so it cannot be reused
        user.resetPasswordToken = undefined;
        user.resetPasswordExpires = undefined;

        await user.save();

        res.status(200).send(
            "Password reset successfully"
        );

    } catch (error) {

        console.log("Reset password error:", error);

        res.status(500).send(
            "Internal server error"
        );
    }
});

// Reset Password
// app.post("/resetPassword", auth, async (req, res) => {
//     try {
//         let { newPassword } = req.body;

//         // Clear the reset password token and expiration
//         const user = await User.findOne({ email: req.user.email });

//         if (!user) {
//             return res.status(404).send("User not found");
//         }

//         const hashedPassword = await bcryptjs.hash(newPassword, 10);

//         user.password = hashedPassword;

//         await user.save();

//         res.status(200).send("Password reset successfully");

//     } catch (error) {
//         console.log("Reset password error:", error);

//         return res.status(500).send("Internal server error");
//     }
// });

// Send Email
const sendEmail = async (to, subject, html) => {

    const transporter = nodemailer.createTransport({
        service: "Gmail",
        auth: {
            user: "aareevs@gmail.com",
            pass: "zlqiofjzltozyjmp"
        }
    });

    const mailOptions = {
        from: "aareevs@gmail.com",
        to,
        subject,
        html
    };

    await transporter.sendMail(mailOptions);
};

app.get("/testEmail", async (req, res) => {
    try {
        await sendEmail(
            "aareevs@gmail.com",
            "Test Email",
            "If you received this, Nodemailer is working! Divyansh is a good boy."
        );

        res.send("Email sent successfully");

    } catch (error) {
        console.log("Email error:", error);
        res.status(500).send("Email failed");
    }
});

module.exports = { sendEmail };

// Start server
app.listen(4000, () => {
    console.log("Server running on http://localhost:4000");
});