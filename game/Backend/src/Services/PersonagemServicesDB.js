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

export const getPersonagensById = async (id_personagem) => {
  const query = `SELECT * FROM personagem WHERE id_personagem = ${id_personagem};`;
  return await getDBConnection(query);
};

export const getPersonagensJogaveis = async () => {
  const query = `
    SELECT pj.*, p.nome
    FROM personagem_jogavel pj
    JOIN personagem p ON pj.id_personagem = p.id_personagem;
  `;
  return await getDBConnection(query);
};

export const getPersonagensNaoJogaveis = async () => {
  const query = `
    SELECT pnj.*, p.nome
    FROM personagem_nao_jogavel pnj
    JOIN personagem p ON pnj.id_personagem = p.id_personagem;
  `;
  return await getDBConnection(query);
};

export const getPersonagensNaoJogaveisPorLocal = async (id_local) => {
  const query = `
    SELECT pnj.*, p.nome
    FROM personagem_nao_jogavel pnj
    JOIN personagem p ON pnj.id_personagem = p.id_personagem
    WHERE p.idlocal = ${id_local};
  `;
  return await getDBConnection(query);
};

export const getPersonagensNaoJogaveisPorId = async (id_personagem) => {
  const query = `
    SELECT pnj.*, p.nome
    FROM personagem_nao_jogavel pnj
    JOIN personagem p ON pnj.id_personagem = p.id_personagem
    WHERE p.id_personagem = ${id_personagem};
  `;
  return await getDBConnection(query);
};

export const movePersonagem = async (id_personagem, id_local) => {
  const query = `
    UPDATE personagem
    SET idLocal = ${id_local}
    WHERE id_personagem = ${id_personagem};
  `;
  return await getDBConnection(query);
};

export const getPartesPersonagem = async (id_personagem) => {
  const query = `
    SELECT * FROM parte
    WHERE idPersonagem = ${id_personagem};
  `;
  return await getDBConnection(query);
};


export const rewardPersonagem = async (id_personagem) => {
  const query = `
    UPDATE inventario
    SET dinAtual = dinAtual + 100
    WHERE id_personagem = ${id_personagem};    
  `;
  return await getDBConnection(query);
};
