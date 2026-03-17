const http = require("http");
require("dotenv").config();
const app = require("./app");

const PORT = process.env.PORT || 5555;

const server = http.createServer(app);

server.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

process.on("SIGTERM", shutdown);
process.on("SIGINT", shutdown);

function shutdown() {
    console.log("Received shutdown signal, shutting down gracefully");
    server.close(() => {
        console.log("Server closed");
        process.exit(0);
    });
}
