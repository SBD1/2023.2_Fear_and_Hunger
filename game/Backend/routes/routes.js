import { Router } from 'express';
import FirstController from "../controller/FirstController.js"

const routes = new Router();

//rotas
routes.get('/', FirstController.getItems);

export default routes;