import { Router } from "express";

export const cartRoutes = Router()

cartRoutes.get("/get-all",(req, res)=> {
    res.status(200).json({message : "ok"})
})

cartRoutes.post("/create", (res, req) => {
    res.status(200).json({message : "ok"})
})

cartRoutes.get("/:id", (req, res) => {
    res.status(200).json({message : "ok"})
})

cartRoutes.put("/update/:id", (req, res)=> {
    res.status(200).json({message : "ok"})
})

cartRoutes.delete("/:id", (req, res) => {
    res.status(200).json({message : "ok"})
})