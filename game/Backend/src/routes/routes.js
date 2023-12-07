import { Router } from "express";
import InventarioController from "../controller/InventarioController.js";
import PersonagemController from "../controller/PersonagemController.js";
import RegiaoController from "../controller/RegiaoController.js";
import ItensController from "../controller/ItensController.js";

const routes = new Router();

//Rotas

routes.get("/", (req, res) => {
  return res.send({ message: "API Online! 👻" });
});

// Rota Personagem
routes.get("/personagem", PersonagemController.getItemPersonagem);
routes.get("/personagem/:localId", PersonagemController.getPersonagensPorLocal);

// Rota Regiao
routes.get("/regiao", RegiaoController.getRegioes);

// Rota de local por regiao
routes.get("/local/:idRegiao", RegiaoController.getLocais);

// Rota de inventario por personagem_jogavel
routes.get(
  "/inventario/:idPersonagem",
  InventarioController.getInventarioPersonagem
);

// Rota para todos os items

routes.get("/item", ItensController.getItens);

export default routes;
