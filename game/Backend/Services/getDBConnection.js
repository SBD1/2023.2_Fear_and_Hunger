import pkg from 'pg';
const { Pool } = pkg;

async function getDBConnection(query, returToCaller = true) {
    //Conectar Banco de Dados

    const connection = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'sbd1_database',
        password: 'postgres',
        port: 5432,
    });

    const client = await connection.connect();
    const resp = await client.query(query);
    client.release();
    if (returToCaller) {
        return resp.rows;
    }
    return console.log("error");
};


export default getDBConnection
