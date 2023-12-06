import getDBConnection from "./getDBConnection.js"

export const getItemLojista = async () => {
  const query = 'SELECT * FROM item'
  return await getDBConnection(query);
}

export const postItemLojista = async ({ id_item, nome, valor }) => {
  console.log({ id_item, nome, valor });
  const query = `INSERT INTO compra_log (id_personagem, id_item, quantidade, valor_total) VALUES (1, ${id_item}, 1, ${valor})`
  return await getDBConnection(query);
}

