import { Router } from 'express';
import FirstController from "../controller/FirstController.js"

const routes = new Router();

//rotas

routes.get('/', (req, res) => {
    return res.send({ message: 'API Online! 👻' });
  });

routes.get('/teste', FirstController.getItems);

export default routes;