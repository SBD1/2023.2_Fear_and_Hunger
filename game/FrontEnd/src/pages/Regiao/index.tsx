import { useEffect, useState } from "react";
import api from "../../api";
import {
  Container,
  Content,
  Header,
  RegiaoContainer,
  WholePage,
} from "./styles";

import { IRegiao } from "../../types";
import { Link, useNavigate, useParams } from "react-router-dom";
import { ArrowLink } from "../Game/styles";
import { GoArrowLeft } from "react-icons/go";

export default function Regiao() {
  const [regioes, setRegioes] = useState<IRegiao[]>([]);

  const navigate = useNavigate();

  const { idPersonagemJogavel } = useParams();

  const getRegioes = async () => {
    try {
      const { data } = await api.get("/regiao");
      setRegioes(data);
    } catch (error) {
      console.error("Erro ao obter personagens:", error);
    }
  };

  useEffect(() => {
    getRegioes();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleClick = (id: number) => {
    navigate(`/game/${id}/${idPersonagemJogavel}`); // Redireciona para o caminho desejado
  };

  return (
    <WholePage>
      <Link to="/personagem">
        <ArrowLink>
          <GoArrowLeft />
        </ArrowLink>
      </Link>
      <Container>
        {regioes?.length === 0 ? (
          <div style={{ color: "#000" }}>No Data</div>
        ) : (
          <>
            {regioes?.map((regiao) => {
              return (
                <RegiaoContainer onClick={() => handleClick(regiao.idregiao)}>
                  <Header>
                    <h2>{regiao.nomer}</h2>
                  </Header>
                  <Content>
                    <p>{regiao.descricao}</p>
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
