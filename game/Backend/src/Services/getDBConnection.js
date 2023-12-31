import pkg from "pg";
const { Pool } = pkg;

async function getDBConnection(query, params = [], returnToCaller = true) {
  // Conectar Banco de Dados
  const connection = new Pool({
    connectionString: `postgres://postgres:postgres@db:5432/sbd1_database`,
  });

  const client = await connection.connect();
  const resp = await client.query(query, params);
  client.release();
  if (returnToCaller) {
    return resp.rows;
  }
}

export default getDBConnection;
