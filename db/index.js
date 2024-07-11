import { config } from "dotenv"
import mysql from "mysql2"

config();
export const pool = mysql.createPool({
    port: process.env.MYSQL_PORT,
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
});

export const connectToDB = async() => {
    try {
        await pool.getConnection;
        console.log("connect to db ok")
    } catch (error) {
        console.log(error);
        throw error
    }
}