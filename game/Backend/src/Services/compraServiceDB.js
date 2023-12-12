import getDBConnection from "./getDBConnection.js";

export const compraItens = async (idPersonagem, idItem) => {
  // const query = "'CALL comprarItem($1, $2)', [idPersonagem, idItem]";
  return await getDBConnection("CALL comprarItem($1, $2)", [
    idPersonagem,
    idItem,
  ]);
};

export const ItemComprados = async () => {
  // console.log('teste');
  // const query = `SELECT * FROM inventario`;
  // return await getDBConnection(query);
  const query = `
        SELECT i.nome, c.quantidade, c.valorTotal, c.dataCompra
        FROM compra c
        JOIN item i ON c.idItem = i.idItem
        WHERE c.id_personagem = $1
        ORDER BY c.dataCompra DESC;
    `;
  return await getDBConnection(query, [1]);
};

export const putParteAtualizarHP = async (id, hp) => {
  const query = `UPDATE parte SET hpAtual = ${hp} WHERE idParte = ${id};
  COMMIT;`;
  return await getDBConnection(query);
};
