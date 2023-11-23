import express from "express";
import routes from "./routes/routes.js";
import cors from "cors";


const server = express();
const port = 3000;

server.use(cors());
server.use(express.json());
server.use(routes);

server.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});