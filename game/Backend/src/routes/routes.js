import { Router } from "express";
import InventarioController from "../controller/InventarioController.js";
import PersonagemController from "../controller/PersonagemController.js";
import RegiaoController from "../controller/RegiaoController.js";
import ItensController from "../controller/ItensController.js";
import CompraController from "../controller/CompraController.js";

const routes = new Router();

//Rotas

routes.get("/", (req, res) => {
  return res.send({ message: "API Online! 👻" });
});

// Rota Personagem
routes.get("/personagem", PersonagemController.getItemPersonagem);
routes.get("/personagem/:localId", PersonagemController.getPersonagensPorLocal);
routes.get(
  "/personagem/only/:id_personagem",
  PersonagemController.getPersonagensById
);

routes.get("/personagem_jogavel", PersonagemController.getPersonagensJogaveis);

routes.get(
  "/personagem_nao_jogavel",
  PersonagemController.getPersonagensNaoJogaveis
);

routes.get(
  "/personagem_nao_jogavel/:id_local",
  PersonagemController.getPersonagensNaoJogaveisPorLocal
);

routes.put(
  "/personagem/move/:id_personagem/:id_local",
  PersonagemController.movePersonagem
);

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

// Rota para compra de item
routes.post("/comprarItem/:idPersonagem/:idItem", CompraController.ComprarItem);
routes.get("/comprarItem/inventario", CompraController.ItemComprados);

export default routes;
