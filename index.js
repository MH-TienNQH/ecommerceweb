import express from "express";
import dotenv from "dotenv"
import { connectToDB } from "./db/index.js";


dotenv.config();

const PORT = process.env.PORT


const app = express();


connectToDB().then(() => {
    app.listen(PORT, () => 
        console.log(`listening on http://localhost:${PORT}`));
}).catch(err => {
    console.log(err);
    process.exit(0);
})



