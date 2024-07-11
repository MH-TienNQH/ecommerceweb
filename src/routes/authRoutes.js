import { login, signup } from '../controllers/authController.js';
import { Router } from "express";

export const authRoutes = Router();

authRoutes.post("/login", login)

authRoutes.post("/signup" , signup)

