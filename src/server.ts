import express from "express";
import { PrismaClient } from "@prisma/client";

const app = express();
const PORT = 3000;
const prisma = new PrismaClient();

app.use(express.json());

app.post("/customer", async (req, res) => {
    const { name, cnpj, email, status, customer_adress, customer_contact } = req.body;

    try {
        // Verifica se o endereço já existe no banco
        const existingAdress = await prisma.customer_adress.findUnique({
            where: {
                id: customer_adress.customer_id
            }
        });

        // Se o endereço já existe, retorna um erro
        if (existingAdress) {
            return res.status(500).send({ message: "Failed to register customer, duplicate address." });
        }

        // Se o endereço não existe, continua com a criação do cliente
        await prisma.customer.create({
            data: {
                name,
                cnpj,
                email,
                status,
                customer_adress: {
                    create: customer_adress,
                },
                customer_contact: {
                    create: customer_contact,
                },
            },
            include: {
                customer_adress: true,
                customer_contact: true,
            },
        });

        res.status(201).send({ message: "Customer registered successfully." });
    } catch (error) {
        console.error(error);
        res.status(500).send({ message: "Failed to register customer." });
    }
});

// app.post("/customer", async (req, res) => {
//     const { name, cnpj, email, status, customer_adress, customer_contact } = req.body;

//     const noAdressDuplicate = await prisma.customer_adress.findUnique({
//         where:{
//             customer_id: customer_adress.customer_id
//         },

//         if(noAdressDuplicate){
//             return res.status(500).send({message: "Failed to register customer, duplicate adress."});
//         }
//     });
//     try {
//         await prisma.customer.create({
//             data: {
//                 name,
//                 cnpj,
//                 email,
//                 status,
//                 customer_adress:{
//                     create: customer_adress,
//                 },
//                 customer_contact:{
//                     create: customer_contact,
//                 },
//             },
//             include:{
//                 customer_adress: true,
//                 customer_contact: true,
//             },
//         });
//     } catch (error) {
//         return res.status(500).send({message: "Failed to register customer."});
//     }
//     res.status(201);
// });

app.get("/customers", async (_, res) => {
    const customers = await prisma.customer.findMany();
    res.status(200).json(customers);
});

// app.get("/customer/:id", async (req, res) => {
//     const index = req.params.id;
//     const result = await prisma.customer.findUnique({
//         where:{
//             id: 1,
//         }
//     });
// });

app.get("/suppliers", async (_, res) => {
    const suppliers = await prisma.supplier.findMany();
    res.status(200).json(suppliers);
});



app.listen(PORT, ()=>{
    console.log("Servidor em execução em http://localhost:3000");
});