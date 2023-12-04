import React, { useEffect, useState } from "react";
import api from "../../api";
import "./styles.css";

interface Personagem {
  idpersonagem: number;
  alma: number;
  local: number;
  tipop: number;
}

const Game = () => {
  const [personagens, setPersonagem] = useState<Personagem[]>([]);

  const getPersonagem = async () => {
    try {
      const { data } = await api.get("/personagem");
      setPersonagem(data);
    } catch (error) {
      console.error("Erro ao obter personagens:", error);
    }
  };

  useEffect(() => {
    getPersonagem();
  }, []);

  return (
    <div className="container">
      <div className="content">
        <h1>Listagem de Personagens 👻</h1>
        <ul>
          {personagens.map((personagem) => (
            <li key={personagem.idpersonagem}>
              <strong>ID do Personagem:</strong> {personagem.idpersonagem}
              <br />
              <strong>Alma:</strong> {personagem.alma}
              <br />
              <strong>Local:</strong> {personagem.local}
              <br />
              <strong>Tipo P:</strong> {personagem.tipop}
              <br />
              <hr />
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default Game;
