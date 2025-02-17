
import { prismaClient } from "../routes/index.js"
import { hashSync ,  compareSync} from "bcrypt";
import { config } from "dotenv";
import jwt from "jsonwebtoken"

config();

const JWT_KEY = process.env.JWT_KEY

export const login = async (req, res) => {
    const {username, password} = req.body;

    let user = await prismaClient.user.findFirst({
        where:{
            username }
    })
    if(!user){
        res.status(401).send("username does not exist")
    }
    if(!compareSync(password, user.password)){
        res.status(401).send("incorrect pw")
        return;
    }
    const token = jwt.sign({
        id: user.id,
        role: user.role
    }, JWT_KEY, {expiresIn: "6h"})
    res.status(200).json({user, token})
}

export const signup = async (req, res, next) => {
    const {name, email, username, password, houseNumber, addressLine, city, country  } = req.body;

    let user = await prismaClient.user.findFirst({
        where: {
            username
        }
    })
    if(user){
        res.status(400).send("User already exist")
    }
    user = await prismaClient.user.create({
        data: {
            name,
            username,
            email,
            password: hashSync(password, 10),
            address:{
                    create:{
                        houseNumber,
                        addressLine,
                        city,
                        country,
                    }
            }
        }
    })
    res.status(200).send(user)
} 