const express = require("express");
const app = express();

app.use(express.json());

// health check
app.get("/health", (req, res) => {
    res.status(200).json({ message: "OK" });
});

// health check
app.get("/new", (req, res) => {
    res.status(200).json({ message: "OK New" });
});

module.exports = app;
