import express from "express";

const app = express();
const PORT = 3000;

app.get("/clientes", (req, res) => {
    res.send("Clientes");
});

app.get("/fornecedores", (req, res) => {
    res.send("Fornecedores");
});

app.listen(PORT, ()=>{
    console.log("Servidor em execução em http://localhost:3000");
});