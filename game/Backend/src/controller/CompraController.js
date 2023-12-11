import {
  ItemComprados,
  compraItens,
  putParteAtualizarHP,
} from "../Services/compraServiceDB.js";

class CompraController {
  async ComprarItem(req, res) {
    try {
      // Acessando o parâmetro da rota
      const { idPersonagem, idItem } = req.params;
      const response = (await compraItens(idPersonagem, idItem)) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Compra não efetuada" });
    }
  }

  async ItemComprados(req, res) {
    try {
      // Acessando o parâmetro da rota
      const response = (await ItemComprados()) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Compra não efetuada" });
    }
  }

  async putParteAtualizarHP(req, res) {
    try {
      // Acessando o parâmetro da rota
      const { id, hp } = req.params;
      const response = (await putParteAtualizarHP(id, hp)) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "error na atualização da vida" });
    }
  }
}

export default new CompraController();
