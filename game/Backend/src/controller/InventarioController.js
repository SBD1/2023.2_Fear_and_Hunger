import { getInventarioPersonagem } from "../Services/InventarioServicesDB.js";
class InventarioController {
  async getInventarioPersonagem(req, res) {
    // Adicionei req e res como parâmetros
    try {
      const { idPersonagem } = req.params;

      const response = await getInventarioPersonagem(idPersonagem);
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default new InventarioController();
