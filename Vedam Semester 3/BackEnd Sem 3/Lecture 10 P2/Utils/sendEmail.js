let nodemailer = require("nodemailer");

let sendEmail = async (to, subject, html) => {

    let transporter = nodemailer.createTransport({
        service: "Gmail",
        auth: {
            user: "your-email@gmail.com",
            pass: "your-app-password"
        }
    });

    let mailOptions = {
        from: "your-email@gmail.com",
        to: to,
        subject: subject,
        html: html
    };

    await transporter.sendMail(mailOptions);
};

module.exports = sendEmail;