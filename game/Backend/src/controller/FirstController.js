import { getItems } from "../Services/firstServicesDB.js";
class FirstController {
    async getItems(req, res) {  // Adicionei req e res como parâmetros
      try {
        const response = await getItems();  
        return res.status(200).json(response);
      } catch (error) {
        console.error(error.message);
        return res.status(500).json({ error: 'Internal Server Error' });
      }
    }
  }
  

export default new FirstController();