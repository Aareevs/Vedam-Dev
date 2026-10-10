const twilio = require('twilio');
const accountSid = process.env.TWILIO_ACCOUNT_SID; // Set in .env
const authToken = process.env.TWILIO_AUTH_TOKEN;   // Set in .env

const client = new twilio(accountSid, authToken);

const sendOtp = (phoneNumber, otp) => {
    client.messages.create({
        body: `Your OTP is ${otp}`,
        
        from: '+918318477783', // From a valid Twilio number
        to: phoneNumber // Text this number
    })
    .then((message) => console.log(message.sid))
    .catch((error) => console.error(error));
}

module.exports = { sendOtp };