import { prismaClient } from "../routes"

export const getAll = async (req, res) => {
    try {
        let products = await prismaClient.product.findMany();
        res.status(200).send(products)
    } catch (error) {
        console.log(error);
        res.status(500).send("sum ting wong")
    }
}

export const getById = async (req, res) => {
    const id = req.params.id
    try {
        let product = await prismaClient.product.findFirst({
            where: id,
        })
        res.status(200).send(product)
    } catch (error) {
        console.log(error)
        res.status(500).send("sum ting wong")
    }
}

export const createProduct = async (req, res) => {
    const {name, desc, image,price,  categoryName, size, color} = req.body
    try {
        let category = await prismaClient.category.findFirst({
            where : categoryName
        })
        if(category){
            categoryId = category.id
        }


        let size = await prismaClient.size.findFirst({
            where: {size: size.sizeName}
        })

        if(size){
            sizeId = size.id
        }

        let color = await prismaClient.color.findFirst({
            where: {
                color : color.colorName
            }
        })

        if(color){
            colorId = color.id
        }
        const product = await prismaClient.product.create({
            data: {
                name,
                desc,
                image,
                price,
                categories:{
                    create:[
                        {
                            category:{
                                connectOrCreate:{
                                    where: {
                                        categoryId,
                                    },
                                    create:{
                                        categoryName
                                    }
                                }
                            }
                        }
                    ]
                },
                size:{
                    connectOrCreate:{
                        where: {
                            sizeId
                        },
                        create:{
                            sizeName,
                        }
                    }
                },
                color: {
                    connectOrCreate:{
                        where:{
                            colorId
                        },
                        create:{
                            colorName
                        }
                    }
                }
            }
        })
        res.status(201).send(product)
    } catch (error) {
        res.status(500).send(error)
    }
}

export const deleteProduct = async(req, res) => {
    const id = req.params.id
    try {
        await prismaClient.product.delete({
            where: id
        })
        res.status(200).send("deleted")
    } catch (error) {
        res.status(500).send(error)
    }
}

export const updateProduct = async (req, res) => {
    const {name, desc, image,price,  categoryName, sizeName, colorName} = req.body
    try {
        let category = await prismaClient.category.findFirst({
            where : categoryName
        })
        if(category){
            categoryId = category.id
        }


        let sizeName = await prismaClient.size.findFirst({
            where: {sizeName,}
        })

        if(sizeName){
            sizeId = sizeName.id
        }

        let colorName = await prismaClient.color.findFirst({
            where: {
                colorName,
            }
        })

        if(colorName){
            colorId = sizeName.id
        }
        const product = await prismaClient.product.create({
            data: {
                name,
                desc,
                image,
                price,
                categories:{
                    create:[
                        {
                            category:{
                                connectOrCreate:{
                                    where: {
                                        categoryId,
                                    },
                                    create:{
                                        categoryName
                                    }
                                }
                            }
                        }
                    ]
                },
                sizeName:{
                    connectOrCreate:{
                        where: {
                            sizeId
                        },
                        create:{
                            sizeName,
                        }
                    }
                },
                colorName: {
                    connectOrCreate:{
                        where:{
                            colorId
                        },
                        create:{
                            colorName
                        }
                    }
                }
            }
        })
        res.status(201).send(product)
    } catch (error) {
        res.status(500).send(error)
    }
}
