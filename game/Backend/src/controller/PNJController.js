import { getItemPNJ } from "../Services/PNJServicesDB.js";
class PNJController {
    async getItemPNJ(req, res) {  // Adicionei req e res como parâmetros
      try {
        const response = await getItemPNJ();  
        return res.status(200).json(response);
      } catch (error) {
        console.error(error.message);
        return res.status(500).json({ error: 'Internal Server Error' });
      }
    }
  }
  

export default new PNJController();