import getDBConnection from "./getDBConnection.js"

export const getItemLojista = async () => {
  const query = 'SELECT * FROM Lojista'
  return await getDBConnection(query);  
}

