import { prismaClient } from "../routes"

export const addShipStatus = async (req, res) => {
    const {shipStatusName} = req.body
    try {
        const shipStatus = prismaClient.shipStatus.create({
            data:{
                shipStatusName
            }
        })
        res.status(200).send(shipStatus)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const getAll = async (req, res) => {
    try {
        const shipStatuses = prismaClient.shipStatus.findMany();
        res.status(200).send(shipStatuses)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const updateshipStatus = async (req, res) => {
    const {shipStatusName} = req.body
    const id = req.params.id
    try {
        const shipStatus = prismaClient.shipStatus.update({
            where:id,
            data:{
                shipStatusName,
            }
        })
        res.status(200).send(shipStatus)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const deleteshipStatus = async (req, res) =>{
    const id = req.params.id
    try {
        await prismaClient.shipStatus.delete({
            where: id
        })
        res.status(200).send("deleted")
    } catch (error) {
        res.status(500).send(error)
    }
}