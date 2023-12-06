import { Router } from "express";
import PersonagemController from "../controller/PersonagemController.js";
import PNJController from "../controller/PNJController.js";
import InventarioController from "../controller/InventarioController.js";
import LojistaController from "../controller/LojistaController.js";
import InimigoController from "../controller/InimigoController.js";
import PJController from "../controller/PJController.js";
import RegiaoController from "../controller/RegiaoController.js";

const routes = new Router();

//Rotas

routes.get("/", (req, res) => {
  return res.send({ message: "API Online! 👻" });
});

// Rota Personagem
routes.get("/personagem", PersonagemController.getItemPersonagem);
routes.post("/newPersonagem", PersonagemController.postNewPersonagem);

// Rota PNJ
routes.get("/PNJ", PNJController.getItemPNJ);

// Rota PJ
routes.get("/PJ", PJController.getItemPJ);

// Rota Inventario
routes.get("/inventario", InventarioController.getItemInventario);

// Rota Lojista
routes.get("/lojista", LojistaController.getItemLojista);
routes.post("/lojista", LojistaController.postItemLojista);

// Rota Inimigo
routes.get("/inimigo", InimigoController.getItemInimigo);

routes.get("/regiao", RegiaoController.getRegioes);

export default routes;
