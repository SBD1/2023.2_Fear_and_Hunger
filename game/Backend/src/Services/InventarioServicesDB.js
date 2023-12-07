import getDBConnection from "./getDBConnection.js";

export const getInventarioPersonagem = async (idPersonagem) => {
  const query = `SELECT * FROM inventario WHERE id_personagem = ${idPersonagem}`;
  return await getDBConnection(query);
};
