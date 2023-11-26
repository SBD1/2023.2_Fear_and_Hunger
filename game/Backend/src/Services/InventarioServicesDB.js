import getDBConnection from "./getDBConnection.js"

export const getItemInventario = async () => {
  const query = 'SELECT * FROM Inventario'
  return await getDBConnection(query);  
}



