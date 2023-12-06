import { getRegioes } from "../Services/RegiaoServiceDB.js";

class RegiaoController {
  async getRegioes(req, res) {
    // Adicionei req e res como parâmetros
    try {
      const response = await getRegioes();
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default new RegiaoController();
