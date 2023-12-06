import React from "react";
import "./styles.css";

export interface Item {
  id_item: number;
  nome: string;
  valor: number;
}

export interface Inventario {
  id_personagem: number;
  id_item: number;
  quantidade: number;
}

interface TabelaItensProps {
  itens: string[];
}

const TabelaItens: React.FC<TabelaItensProps> = ({ itens }) => {
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        minWidth: "fit-content",
        width: "25%",
        height: "70%",
        borderRadius: "10px",
        listStyle: "none",
        alignItems: "center",
        justifyContent: "space-around",
        boxShadow: "0px 0px 20px 0px rgba(0, 0, 0, 0.75)",
      }}
    >
      <h3>Inventario</h3>
      <table>
        <thead>
          <tr>
            {/* <th>ID</th> */}
            <th>Nome</th>
            {/* <th>Valor</th> */}
          </tr>
        </thead>
        <tbody>
          {itens.map((item) => (
            <tr key={item}>
              {/* <td>{item.id_item}</td> */}
              <td>{item}</td>
              {/* <td>{item.valor}</td> */}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default TabelaItens;
