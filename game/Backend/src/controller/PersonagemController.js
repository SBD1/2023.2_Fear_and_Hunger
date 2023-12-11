import {
  getItemPersonagem,
  getPersonagensPorLocal,
  getPersonagensById,
  getPersonagensJogaveis,
  getPersonagensNaoJogaveis,
  movePersonagem,
  getPersonagensNaoJogaveisPorLocal,
  getPersonagensNaoJogaveisPorId,
  getPartesPersonagem,
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

  async getPersonagensJogaveis(req, res) {
    try {
      const response = (await getPersonagensJogaveis()) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }

  async getPersonagensNaoJogaveis(req, res) {
    try {
      const response = (await getPersonagensNaoJogaveis()) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }

  async getPersonagensNaoJogaveisPorLocal(req, res) {
    try {
      const { id_local } = req.params;
      const response =
        (await getPersonagensNaoJogaveisPorLocal(id_local)) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }

  async getPersonagensNaoJogaveisPorId(req, res) {
    try {
      const id_personagem = parseInt(req.params.id_personagem, 10);
      const response =
        (await getPersonagensNaoJogaveisPorId(id_personagem)) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }

  async movePersonagem(req, res) {
    try {
      const { id_personagem, id_local } = req.params;

      const response = movePersonagem(id_personagem, id_local);
      return res.status(200).json({ message: "Personagem movido!" });
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }

  async getPartesPersonagem(req, res) {
    try {
      const { id_personagem } = req.params;

      const response = (await getPartesPersonagem(id_personagem)) ?? null;
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default new PersonagemController();
