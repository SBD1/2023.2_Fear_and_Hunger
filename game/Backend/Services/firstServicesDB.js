import getDBConnection from "./getDBConnection.js"

export const getItems = async () => {
  const query = 'SELECT * FROM users'
  return await getDBConnection(query);  
}

