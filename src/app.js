const express = require("express");
const app = express();

const { exec } = require("child_process");
const util = require("util");
const execPromise = util.promisify(exec);
const path = require('path');

app.use(express.json());

// health check
app.get("/health", (req, res) => {
    res.status(200).json({ message: "OK" });
});

// health check
app.get("/new", (req, res) => {
    res.status(200).json({ message: "OK New" });
});

app.get("/test", (req, res) => {
    res.status(200).json({ message: "OK Test Deployment done " + process.pid });
});

app.post('/deploy-webhook', (req, res) => {
    const data = req.body;

    if (!data || !data.ref) {
        return res.status(400).json({ message: "Invalid request" });
    }

    if (data.ref !== 'refs/heads/main') {
        return res.status(200).json({ message: "Not main branch, skipping deploy." });
    }

    console.log("Deployment started");
    res.status(202).json({ message: "Deployment started" });
    executeDeployScript()
        .then((output) => console.log("Deploy Success:", output))
        .catch((err) => console.error("Deploy Failed:", err.message));
});

async function executeDeployScript() {
    const scriptPath = path.join(__dirname, '../deploy.sh');
    console.log(scriptPath);
    const { stdout, stderr } = await execPromise(`sh ${scriptPath}`);
    if (stderr) {
        console.warn("Script Warning:", stderr);
    }
    return stdout;
}
module.exports = app;
