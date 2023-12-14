import express from "express";
import { PrismaClient } from "@prisma/client";

const app = express();
const PORT = 3000;
const prisma = new PrismaClient();

app.get("/customers", async(req, res) => {
    const customers = await prisma.customer.findMany();
    res.status(200).json(customers);
});

app.get("/suppliers", async(req, res) => {
    const suppliers = await prisma.supplier.findMany();
    res.send("Fornecedores").json(suppliers);
});

app.listen(PORT, ()=>{
    console.log("Servidor em execução em http://localhost:3000");
});