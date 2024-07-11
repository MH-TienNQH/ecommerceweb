import { Router } from "express";

export const productRoutes = Router()

productRoutes.get("/get-all",(req, res)=> {
    res.status(200).json({message : "ok"})
})

productRoutes.post("/create", (res, req) => {
    res.status(200).json({message : "ok"})
})

productRoutes.get("/:id", (req, res) => {
    res.status(200).json({message : "ok"})
})

productRoutes.put("/update/:id", (req, res)=> {
    res.status(200).json({message : "ok"})
})

productRoutes.delete("/:id", (req, res) => {
    res.status(200).json({message : "ok"})
})