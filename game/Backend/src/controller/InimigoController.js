import { getItemInimigo } from "../Services/InimigoServicesDB.js";
class InimigoController {
    async getItemInimigo(req, res) {  // Adicionei req e res como parâmetros
      try {
        const response = await getItemInimigo();  
        return res.status(200).json(response);
      } catch (error) {
        console.error(error.message);
        return res.status(500).json({ error: 'Internal Server Error' });
      }
    }
  }
  

export default new InimigoController();