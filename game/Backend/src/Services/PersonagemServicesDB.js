import getDBConnection from "./getDBConnection.js"

export const getItemPersonagem = async () => {
  const query = 'SELECT * FROM Personagem'
  return await getDBConnection(query);  
}

export const postNewPersonagem = async () => {
  const query = 'INSERT INTO Personagem(alma, local, tipoP) VALUES (4, 1005, 2)'
  return await getDBConnection(query);  
}

