const express = require("express");

const router = express.Router();

const { sendOtp } = require("./TwilioService");

router.post("/send-otp", async (req, res) => {

    try {

        const { phoneNumber } = req.body;

        if (!phoneNumber) {
            return res.status(400).json({
                message: "Phone number is required"
            });
        }

        // Generate 6 digit OTP
        const otp = Math.floor(100000 + Math.random() * 900000);

        // Send OTP
        await sendOtp(phoneNumber, otp);

        // Store OTP in session
        req.session.otp = otp;
        req.session.phoneNumber = phoneNumber;

        res.status(200).json({
            message: "OTP sent successfully"
        });

    } catch (error) {

        console.error("Twilio Error:", error);

        res.status(500).json({
            message: "Failed to send OTP",
            error: error.message
        });
    }
});
module.exports = router;