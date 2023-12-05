import getDBConnection from "./getDBConnection.js"

export const getItemInventario = async () => {
  const query = 'SELECT * FROM inventario'
  return await getDBConnection(query);  
}



