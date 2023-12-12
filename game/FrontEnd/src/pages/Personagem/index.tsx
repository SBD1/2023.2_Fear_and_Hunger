import { useEffect, useState } from "react";
import api from "../../api";
import {
  Container,
  Content,
  Header,
  RegiaoContainer,
  WholePage,
} from "./styles";

import { Link, useNavigate } from "react-router-dom";
import { IPersonagemJogavel } from "../../types";
import { GoArrowLeft } from "react-icons/go";
import { ArrowLink } from "../Game/styles";

export default function Personagem() {
  const [personagensJogaveis, setPersonagensJogaveis] = useState<
    IPersonagemJogavel[]
  >([]);

  const navigate = useNavigate();

  const getPersonagensJogaveis = async () => {
    try {
      const { data } = await api.get("/personagem_jogavel");
      setPersonagensJogaveis(data);
    } catch (error) {
      console.error("Erro ao obter personagens:", error);
    }
  };

  useEffect(() => {
    if (personagensJogaveis.length === 0) {
      getPersonagensJogaveis();
    }
  }, [personagensJogaveis?.length]);

  const handleClick = (id: number) => {
    navigate(`/regiao/${id}`); // Redireciona para o caminho desejado
  };

  return (
    <WholePage>
      <Link to="/">
        <ArrowLink>
          <GoArrowLeft />
        </ArrowLink>
      </Link>
      <Container>
        <div
          style={{
            display: "flex",
            width: "100%",
            height: "10%",
            position: "absolute",
            justifyContent: "center",
            alignItems: "center",
            top: 0,
          }}
        >
          <h1>Selecione seu Personagem</h1>
        </div>
        {personagensJogaveis?.length === 0 ? (
          <div style={{ color: "#000" }}>No Data</div>
        ) : (
          <>
            {personagensJogaveis?.map((personagem) => {
              return (
                <RegiaoContainer
                  onClick={() =>
                    personagem.hpatual > 0
                      ? handleClick(personagem.id_personagem)
                      : null
                  }
                >
                  <Header>
                    <h2>{personagem.nome}</h2>
                  </Header>
                  <Content>
                    <p>{`Vida: ${personagem.hpatual}/${personagem.hpmax}`}</p>
                    <p>{`Arma: ${personagem.arma}`}</p>
                    {personagem.hpatual === 0 ? (
                      <p style={{ color: "red" }}>Morto</p>
                    ) : (
                      <p style={{ color: "green" }}>Vivo</p>
                    )}
                  </Content>
                </RegiaoContainer>
              );
            })}
          </>
        )}
      </Container>
    </WholePage>
  );
}
