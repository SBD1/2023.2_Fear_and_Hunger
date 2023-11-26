import { getItemLojista } from "../Services/LojistaServicesDB.js";
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
  }
  

export default new LojistaController();