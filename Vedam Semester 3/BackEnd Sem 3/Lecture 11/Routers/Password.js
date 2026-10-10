let express = require("express");
let crypto = require("crypto");
let bcryptjs = require("bcryptjs");

let User = require("../Models/User");
let sendEmail = require("../Utils/sendEmail");

let router = express.Router();

router.post("/forgetPassword", async (req, res) => {

    try {

        let { email } = req.body;

        if (!email) {
            return res.status(400).send("Email is required");
        }

        let user = await User.findOne({ email });

        if (!user) {
            return res.status(200).send(
                "If an account exists with this email, a reset link has been sent."
            );
        }

        let resetToken = crypto
            .randomBytes(32)
            .toString("hex");

        user.resetPasswordToken = resetToken;

        user.resetPasswordExpires =
            Date.now() + 15 * 60 * 1000;

        await user.save();

        let resetLink =
    `http://localhost:5174/reset-password?token=${resetToken}`;

let emailHTML = `
    <div style="
        font-family: Arial, sans-serif;
        max-width: 600px;
        margin: auto;
    ">

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
            If you did not request a password reset,
            you can safely ignore this email.
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

// Reset Password
router.post("/resetPassword", async (req, res) => {

    try {

        let { token, newPassword } = req.body;

        if (!token || !newPassword) {
            return res.status(400).send(
                "Token and new password are required"
            );
        }

        let user = await User.findOne({
            resetPasswordToken: token,
            resetPasswordExpires: {
                $gt: Date.now()
            }
        });

        if (!user) {
            return res.status(400).send(
                "Invalid or expired reset link"
            );
        }

        let hashedPassword =
            await bcryptjs.hash(newPassword, 10);

        user.password = hashedPassword;

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

module.exports = router;