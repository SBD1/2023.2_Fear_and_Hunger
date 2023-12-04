import getDBConnection from "./getDBConnection.js"

export const getItemInimigo = async () => {
  const query = 'SELECT * FROM Inimigo'
  return await getDBConnection(query);  
}

