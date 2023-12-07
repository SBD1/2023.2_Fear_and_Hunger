import getDBConnection from "./getDBConnection.js";

export const getRegioes = async () => {
  const query = "SELECT * FROM regiao";
  return await getDBConnection(query);
};

export const getLocais = async (idRegiao) => {
  const query = `SELECT * FROM local WHERE idRegiao = ${idRegiao}`;
  return await getDBConnection(query);
};
