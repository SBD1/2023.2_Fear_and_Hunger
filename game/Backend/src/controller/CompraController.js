import { ItemComprados, compraItens } from "../Services/compraServiceDB.js";

class CompraController {
  async ComprarItem(req, res) {
    try {
      // Acessando o parâmetro da rota
      const { idPersonagem, idItem } = req.params;
      console.log("DEU bom o params", idPersonagem, idItem);
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
}

export default new CompraController();
