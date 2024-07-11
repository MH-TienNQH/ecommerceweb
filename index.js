import express from "express";
import dotenv from "dotenv"
import rootRoutes from "./src/routes/index.js"

dotenv.config();

const PORT = process.env.PORT


const app = express();

app.use(express.json())


app.use("/api", rootRoutes)

app.listen(PORT, () => 
        console.log(`listening on http://localhost:${PORT}`));
    


