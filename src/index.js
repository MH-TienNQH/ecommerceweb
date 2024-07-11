import express from "express";
import dotenv from "dotenv"
import { connectToDB } from "./db/index.js";
import { userRoutes } from "./routes/userRoutes.js"
import { productRoutes } from "./routes/productRoutes.js"


dotenv.config();

const PORT = process.env.PORT


const app = express();

app.use(express.json())


app.use("/api/user/", userRoutes)
app.use("/api/product", productRoutes)


connectToDB().then(() => {
    app.listen(PORT, () => 
        console.log(`listening on http://localhost:${PORT}`));
}).catch(err => {
    console.log(err);
    process.exit(0);
})
    


