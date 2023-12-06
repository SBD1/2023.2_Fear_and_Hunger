import { useEffect, useState } from "react";
import api from "../../api";
import ItensForm from "../../components/Loja";
import TabelaItens, {
  Inventario,
} from "../../components/TabelaItens/TabelaItens";
import "./styles.css";

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
  const [item, setItem] = useState<string[]>([]);

  // id que sera usado para fazer a query dos locais
  // const { idLocal } = useParams();

  const getPersonagem = async () => {
    try {
      const { data } = await api.get("/personagem");
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
    getInventario();
    getItens();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div className="container">
      <div className="content">
        <h1>Fear Hunger</h1>
        <div className="grid">
          <ul>
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
          <ItensForm />
          <TabelaItens itens={item} />
        </div>
      </div>
    </div>
  );
};

export default Game;
