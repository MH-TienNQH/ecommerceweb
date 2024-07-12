import { prismaClient } from "../routes"

export const addSize = async (req, res) => {
    const {sizeName} = req.body
    try {
        const size = prismaClient.size.create({
            data:{
                sizeName
            }
        })
        res.status(200).send(size)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const getAll = async (req, res) => {
    try {
        const sizes = prismaClient.size.findMany();
        res.status(200).send(sizes)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const updatesize = async (req, res) => {
    const {sizeName} = req.body
    const id = req.params.id
    try {
        const size = prismaClient.size.update({
            where:id,
            data:{
                sizeName,
            }
        })
        res.status(200).send(size)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const deletesize = async (req, res) =>{
    const id = req.params.id
    try {
        await prismaClient.size.delete({
            where: id
        })
        res.status(200).send("deleted")
    } catch (error) {
        res.status(500).send(error)
    }
}