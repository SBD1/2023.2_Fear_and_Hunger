import { getItens } from "../Services/ItemServiceDB.js";
class ItensController {
  async getItens(req, res) {
    // Adicionei req e res como parâmetros
    try {
      const response = await getItens();
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default new ItensController();
