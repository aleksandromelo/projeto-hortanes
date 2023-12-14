import express from "express";
import { PrismaClient } from "@prisma/client";

const app = express();
const PORT = 3000;
const prisma = new PrismaClient();

app.get("/customers", async(req, res) => {
    const customers = await prisma.customer.findMany();
    res.status(200).json(customers);
});

app.get("/fornecedores", (req, res) => {
    res.send("Fornecedores");
});

app.listen(PORT, ()=>{
    console.log("Servidor em execução em http://localhost:3000");
});