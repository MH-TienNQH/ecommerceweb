import { prismaClient } from "../routes"

export const addColor = async (req, res) => {
    const {colorName} = req.body
    try {
        const color = prismaClient.color.create({
            data:{
                colorName
            }
        })
        res.status(200).send(color)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const getAll = async (req, res) => {
    try {
        const colors = prismaClient.color.findMany();
        res.status(200).send(colors)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const updatecolor = async (req, res) => {
    const {colorName} = req.body
    const id = req.params.id
    try {
        const color = prismaClient.color.update({
            where:id,
            data:{
                colorName,
            }
        })
        res.status(200).send(color)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const deletecolor = async (req, res) =>{
    const id = req.params.id
    try {
        await prismaClient.color.delete({
            where: id
        })
        res.status(200).send("deleted")
    } catch (error) {
        res.status(500).send(error)
    }
}