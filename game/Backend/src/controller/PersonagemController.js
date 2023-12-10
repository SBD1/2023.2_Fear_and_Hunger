import {
  getItemPersonagem,
  getPersonagensPorLocal,
  getPersonagensById,
} from "../Services/PersonagemServicesDB.js";
class PersonagemController {
  async getItemPersonagem(req, res) {
    // Adicionei req e res como parâmetros
    try {
      const response = await getItemPersonagem();
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }

  async getPersonagensPorLocal(req, res) {
    console.log(req.params);
    try {
      // Acessando o parâmetro da rota
      const { localId } = req.params;
      const response = (await getPersonagensPorLocal(localId)) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }

  async getPersonagensById(req, res) {    
    try {
      // Acessando o parâmetro da rota
      const { id_personagem } = req.params;      
      const response = (await getPersonagensById(id_personagem)) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default new PersonagemController();
