import { useEffect, useState } from "react";
import api from "../../api";
import ItensForm from "../../components/Loja";
import TabelaItens, {
  Inventario,
} from "../../components/TabelaItens/TabelaItens";
import { Container, Content, Header, WholePage } from "./styles";
import { useParams } from "react-router-dom";
import { ILocal } from "../../types";

interface Personagem {
  id_personagem?: number;
  alma?: number;
  nome?: string;
  dinheiro?: number;
  local?: number;
  tipop?: number;
}

const Game = () => {
  const [personagens, setPersonagem] = useState<Personagem[]>([]);
  const [inventario, setInventario] = useState<Inventario[]>([]);
  const [locais, setLocais] = useState<ILocal[]>([]);
  const [item, setItem] = useState<string[]>([]);

  const [selectedLocalId, setSelectedLocalId] = useState<number>(
    locais[0]?.idlocal
  );

  // id que sera usado para fazer a query dos locais
  const { idRegiao } = useParams();

  console.log(selectedLocalId);

  const getLocais = async () => {
    try {
      const { data } = await api.get(`/local/${idRegiao}`);
      setLocais(data);

      if (selectedLocalId === undefined) {
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

  const getInventario = async () => {
    try {
      const { data } = await api.get("/inventario");
      setInventario(data);
    } catch (error) {
      console.error("Erro ao obter personagens:", error);
    }
  };

  const getItens = async () => {
    try {
      const { data } = await api.get("/lojista");

      const result = inventario.map((item) => {
        return data.find((i: { id_item: number }) => i.id_item === item.id_item)
          .nome;
      });
      console.log(result);
      setItem(result);
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
    getInventario();
    getItens();
    getLocais();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <WholePage>
      <Container>
        <Header>
          <h1>Fear Hunger</h1>
        </Header>
        <Content>
          <ul
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
            <h1>Personagens</h1>
            {personagens.map((personagem) => (
              <li key={personagem.id_personagem}>
                <h3>Informações do Personagem</h3>
                <strong>ID do Personagem:</strong> {personagem.id_personagem}
                <br />
                <strong>Nome:</strong> {personagem.nome}
                <br />
                <strong>Dinheiro:</strong> {personagem.dinheiro}
                <br />
                {/* <strong>Tipo P:</strong> {personagem.tipop} */}
                <br />
                <hr />
              </li>
            ))}
          </ul>

          <ul
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
          </ul>
          <ItensForm />
          <TabelaItens itens={item} />
        </Content>
      </Container>
    </WholePage>
  );
};

export default Game;
