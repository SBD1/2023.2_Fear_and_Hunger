import getDBConnection from "./getDBConnection.js";

export const getItemPJ = async () => {
  const query = "SELECT * FROM PersonagemJogavel";
  return await getDBConnection(query);
};
