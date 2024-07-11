import { Router } from "express";

export const addressRoutes = Router()

addressRoutes.get("/get-all",(req, res)=> {
    res.status(200).json({message : "ok"})
})

addressRoutes.post("/create", (res, req) => {
    res.status(200).json({message : "ok"})
})

addressRoutes.get("/:id", (req, res) => {
    res.status(200).json({message : "ok"})
})

addressRoutes.put("/update/:id", (req, res)=> {
    res.status(200).json({message : "ok"})
})

addressRoutes.delete("/:id", (req, res) => {
    res.status(200).json({message : "ok"})
})