import { getItemLojista, postItemLojista } from "../Services/LojistaServicesDB.js";
class LojistaController {
  async getItemLojista(req, res) {  // Adicionei req e res como parâmetros
    try {
      const response = await getItemLojista();
      return res.status(200).json(response);
    } catch (error) {
      console.error(error.message);
      return res.status(500).json({ error: 'Internal Server Error' });
    }
  }

  async postItemLojista(req, res) {  // Adicionei req e res como parâmetros    
    try {
      const response = await postItemLojista(req.body);
      return res.status(200).json(response);
    } catch (error) {
      if (error.message.toLowerCase().includes("duplicate key")) {
        return res.status(409).json({ error: 'Conflict! Duplicate infos' });
      }

      console.error(error.message);

      return res.status(500).json({ error: 'Internal Server Error' });
    }
  }

}


export default new LojistaController();