import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import api from "../../api";
import { ILocal, IPersonagem } from "../../types";
import {
  Container,
  Content,
  Header,
  LocaisCotaniner,
  LocaisList,
  LocalRow,
  WholePage,
} from "./styles";

const Game = () => {
  const [personagens, setPersonagem] = useState<IPersonagem[]>([]);
  const [locais, setLocais] = useState<ILocal[]>([]);

  const [selectedLocalId, setSelectedLocalId] = useState<number | null>(null);

  // id que sera usado para fazer a query dos locais
  const { idRegiao } = useParams();

  console.log(selectedLocalId);

  const getLocais = async () => {
    try {
      const { data } = await api.get(`/local/${idRegiao}`);
      setLocais(data);

      if (selectedLocalId === null) {
        setSelectedLocalId(data[0]?.idlocal);
      }
    } catch (error) {
      console.error("Erro ao obter locais:", error);
    }
  };

  const getPersonagem = async () => {
    try {
      const { data } = await api.get(`/personagem/${selectedLocalId}`);
      setPersonagem(data);
    } catch (error) {
      console.error("Erro ao obter personagens:", error);
    }
  };

  useEffect(() => {
    getPersonagem();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedLocalId]);

  useEffect(() => {
    getPersonagem();
    getLocais();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <WholePage>
      <Container>
        <Header>
          <h1>{`Local: ${
            locais.find((local) => local.idlocal === selectedLocalId)?.nomel
          }`}</h1>
        </Header>
        <Content>
          <LocaisCotaniner>
            <h1>Locais</h1>
            <LocaisList>
              {locais?.map((local) => (
                <LocalRow
                  isSelected={local.idlocal === selectedLocalId}
                  onClick={() => setSelectedLocalId(local.idlocal)}
                >
                  {local.nomel}
                </LocalRow>
              ))}
            </LocaisList>
          </LocaisCotaniner>
        </Content>
      </Container>
    </WholePage>
  );
};

export default Game;

{
  /* <ul
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
  }}
>
  <h1>Locais</h1>
  {locais?.map((local) => (
    <li key={local.idlocal}>
      <strong
        style={{
          color: selectedLocalId === local.idlocal ? "red" : "",
          cursor: "pointer",
        }}
        onClick={() => setSelectedLocalId(local.idlocal)}
      >
        Nome:
      </strong>{" "}
      {local.nomel}
      <br />
      <hr />
    </li>
  ))}
</ul> */
}
