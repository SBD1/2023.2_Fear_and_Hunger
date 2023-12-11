import { useNavigate } from "react-router-dom";
import { IPersonagemNaoJogavel } from "../../types";
import { Body, Footer, Header, ModalContainer, Card } from "./styles";

interface IInimigoModal {
  inimigos: IPersonagemNaoJogavel[];
  idPersonagemJogavel: string | undefined;
  idRegiao: string | undefined;
}

export default function InimigoModal({
  inimigos,
  idRegiao,
  idPersonagemJogavel,
}: IInimigoModal) {
  const navigate = useNavigate();

  const handleClick = (id: number) => {
    navigate(`/batalha/${idRegiao}/${idPersonagemJogavel}/${id}`); // Redireciona para o caminho desejado
  };
  return (
    <ModalContainer>
      <Header>
        <h1>Inimigos</h1>
      </Header>
      <Body>
        {inimigos?.map((inimigo) => {
          return (
            <Card onClick={() => handleClick(inimigo.id_personagem)}>
              <h2>Nome: {inimigo.nome}</h2>
              <p>Descrição: {inimigo.descricao}</p>
              <p>Fala: {inimigo.fala}</p>
            </Card>
          );
        })}
      </Body>

      <Footer></Footer>
    </ModalContainer>
  );
}
