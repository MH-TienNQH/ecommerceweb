import { prismaClient } from "../routes/index.js"
import { hashSync ,  compareSync} from "bcrypt";
import { config } from "dotenv";
import pkg from 'jsonwebtoken';
const { sign } = pkg;

config();

const JWT_KEY = process.env.JWT_KEY.toString()

export const login = async (req, res) => {
    const {username, password} = req.body;

    let user = await prismaClient.user.findFirst({
        where:{
            username }
    })
    if(!user){
        throw Error ("username does not exist")
    }
    if(!compareSync(password, hashSync(user.password, 10))){
        res.status(401).send("incorrect pw")
        return;
    }
    const token = sign(user, JWT_KEY, {expiresIn: "6h"})
    res.status(200).json(user)
}

export const signup = async (req, res) => {
    const {name, email, username, password } = req.body;

    let user = await prismaClient.user.findFirst({
        where: {
            username
        }
    })
    if(user){
        throw Error ("user exist")
    }
    user = await prismaClient.user.create({
        data: {
            name,
            username,
            email,
            password: hashSync(toString(password), 10)
        }
    })
    res.json(user)
} 