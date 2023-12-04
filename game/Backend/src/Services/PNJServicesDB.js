import getDBConnection from "./getDBConnection.js"

export const getItemPNJ = async () => {
  const query = 'SELECT * FROM PNJ'
  return await getDBConnection(query);  
}

