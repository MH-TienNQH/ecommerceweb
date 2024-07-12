import { prismaClient } from "../routes"

export const addCategory = async (req, res) => {
    const {categoryName} = req.body
    try {
        const category = prismaClient.category.create({
            data:{
                categoryName
            }
        })
        res.status(200).send(category)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const getAll = async (req, res) => {
    try {
        const categories = prismaClient.category.findMany();
        res.status(200).send(categories)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const updateCategory = async (req, res) => {
    const {categoryName} = req.body
    const id = req.params.id
    try {
        const category = prismaClient.category.update({
            where:id,
            data:{
                categoryName,
            }
        })
        res.status(200).send(category)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const deleteCategory = async (req, res) =>{
    const id = req.params.id
    try {
        await prismaClient.category.delete({
            where: id
        })
        res.status(200).send("deleted")
    } catch (error) {
        res.status(500).send(error)
    }
}