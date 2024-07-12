import { prismaClient } from "../routes"

export const addShipMethod = async (req, res) => {
    const {shipMethodName} = req.body
    try {
        const shipMethod = prismaClient.shipMethod.create({
            data:{
                shipMethodName
            }
        })
        res.status(200).send(shipMethod)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const getAll = async (req, res) => {
    try {
        const shipMethods = prismaClient.shipMethod.findMany();
        res.status(200).send(shipMethods)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const updateshipMethod = async (req, res) => {
    const {shipMethodName} = req.body
    const id = req.params.id
    try {
        const shipMethod = prismaClient.shipMethod.update({
            where:id,
            data:{
                shipMethodName,
            }
        })
        res.status(200).send(shipMethod)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const deleteshipMethod = async (req, res) =>{
    const id = req.params.id
    try {
        await prismaClient.shipMethod.delete({
            where: id
        })
        res.status(200).send("deleted")
    } catch (error) {
        res.status(500).send(error)
    }
}