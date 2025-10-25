const functions = require("firebase-functions");
const nodemailer = require("nodemailer");
const fs = require("fs");
const path = require("path");
require("dotenv").config();

const gmailEmail = process.env.GMAIL_EMAIL;
const gmailPassword = process.env.GMAIL_PASSWORD;

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: gmailEmail,
    pass: gmailPassword,
  },
});

exports.sendContactEmail = functions.https.onRequest(async (req, res) => {
  res.set("Access-Control-Allow-Origin", "*");
  res.set("Access-Control-Allow-Methods", "POST, OPTIONS");
  res.set("Access-Control-Allow-Headers", "Content-Type");

  if (req.method === "OPTIONS") {
    return res.status(204).send("");
  }

  const { firstName, lastName, email, subject, message } = req.body;
  if (!firstName || !lastName || !email || !message) {
    return res.status(400).send("Missing required fields.");
  }

  // Load and fill the HTML template
  const templatePath = path.join(__dirname, "email_template.html");
  let htmlTemplate = fs.readFileSync(templatePath, "utf8");
  htmlTemplate = htmlTemplate
    .replace(/{{firstName}}/g, firstName)
    .replace(/{{lastName}}/g, lastName)
    .replace(/{{email}}/g, email)
    .replace(/{{subject}}/g, subject || "No Subject")
    .replace(/{{message}}/g, message);

    const mailOptions = {
    from: `"${firstName} ${lastName}" <${email}>`, // send *from* your Gmail
    replyTo: email, // when you reply, it goes to the user's address
    to: [gmailEmail, "ballesteros.johntristan.valdez@gmail.com"],
    subject: subject || "New Contact Message",
    html: htmlTemplate,
    };

  try {
    await transporter.sendMail(mailOptions);
    res.status(200).send("Email sent successfully!");
  } catch (error) {
    console.error("Error sending email:", error);
    res.status(500).send("Failed to send email.");
  }
});
