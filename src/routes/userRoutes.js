import { Router } from "express";

export const userRoutes = Router()

userRoutes.get("/get-all",(req, res)=> {
    res.status(200).send({message : "ok"})
})

userRoutes.post("/create", (res, req) => {
    res.status(200).send({message : "ok"})
})

userRoutes.get("/:id", (req, res) => {
    res.status(200).send({message : "ok"})
})

userRoutes.put("/update/:id", (req, res)=> {
    res.status(200).send({message : "ok"})
})

userRoutes.delete("/:id", (req, res) => {
    res.status(200).send({message : "ok"})
})