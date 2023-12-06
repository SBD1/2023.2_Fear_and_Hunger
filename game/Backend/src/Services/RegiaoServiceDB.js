import getDBConnection from "./getDBConnection.js";

export const getRegioes = async () => {
  const query = "SELECT * FROM Regiao";
  return await getDBConnection(query);
};
