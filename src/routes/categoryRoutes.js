import { Router } from "express";

export const categoryRoutes = Router()

categoryRoutes.get("/get-all",(req, res)=> {
    res.status(200).json({message : "ok"})
})

categoryRoutes.post("/create", (res, req) => {
    res.status(200).json({message : "ok"})
})

categoryRoutes.get("/:id", (req, res) => {
    res.status(200).json({message : "ok"})
})

categoryRoutes.put("/update/:id", (req, res)=> {
    res.status(200).json({message : "ok"})
})

categoryRoutes.delete("/:id", (req, res) => {
    res.status(200).json({message : "ok"})
})