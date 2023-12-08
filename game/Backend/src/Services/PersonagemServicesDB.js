import getDBConnection from "./getDBConnection.js";

export const getItemPersonagem = async () => {
  const query = "SELECT * FROM personagem";
  return await getDBConnection(query);
};

export const getPersonagensPorLocal = async (idLocal) => {  
  const query = `SELECT personagem.*, local.imgTexto
  FROM personagem
  INNER JOIN local ON personagem.idLocal = local.idLocal
  WHERE personagem.idLocal = ${idLocal};
  `;
  return await getDBConnection(query);
};
