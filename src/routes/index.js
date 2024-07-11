import { Router } from "express";
import { authRoutes } from "./authRoutes.js";
import { PrismaClient } from "@prisma/client";

const rootRouter = Router();

rootRouter.use("/auth", authRoutes)

export const prismaClient = new PrismaClient({
    log: ['query']
})

export default rootRouter;