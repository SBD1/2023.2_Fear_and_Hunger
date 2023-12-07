import getDBConnection from "./getDBConnection.js";

export const getItens = async () => {
  const query = "SELECT * FROM item";
  return await getDBConnection(query);
};
