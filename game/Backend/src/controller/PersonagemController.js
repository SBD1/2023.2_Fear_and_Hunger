import { getItemPersonagem,postNewPersonagem } from "../Services/PersonagemServicesDB.js";
class PersonagemController {
    async getItemPersonagem(req, res) {  // Adicionei req e res como parâmetros
      try {
        const response = await getItemPersonagem();  
        return res.status(200).json(response);
      } catch (error) {
        console.error(error.message);
        return res.status(500).json({ error: 'Internal Server Error' });
      }
    }

    async postNewPersonagem(req, res) {  // Adicionei req e res como parâmetros
      try {
        const response = await postNewPersonagem();  
        return res.status(200).json(response);
      } catch (error) {
        console.error(error.message);
        return res.status(500).json({ error: 'Internal Server Error' });
      }
    }
  }
  

export default new PersonagemController();