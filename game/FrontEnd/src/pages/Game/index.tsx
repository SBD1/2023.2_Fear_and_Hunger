import { useEffect, useMemo, useRef, useState } from "react";
import { useParams } from "react-router-dom";
import api from "../../api";
import { IInventario, ILocal, IPersonagem, Item } from "../../types";
import { useNavigate } from "react-router-dom";
import {
  Container,
  Content,
  Header,
  InventarioContainer,
  LocaisCotaniner,
  LocaisList,
  LocalDetailsContainer,
  LojistaContainer,
  LocalRow,
  WholePage,
  BtnBack,
  SubMenoRow,
} from "./styles";
import InventarioModal from "../../components/InventarioModal";
import LojaModal from "../../components/LojaModal";

const Game = () => {
  const [invertarioOpen, setInvertarioOpen] = useState(false);
  const [lojaOpen, setLojaOpen] = useState(false);
  const [personagens, setPersonagem] = useState<IPersonagem[]>([]);
  const [locais, setLocais] = useState<ILocal[]>([]);
  const [inventario, setInventario] = useState<IInventario>({} as IInventario);
  const [itemList, setItemList] = useState<Item[]>([]);

  const [selectedLocalId, setSelectedLocalId] = useState<number | null>(null);

  const navigate = useNavigate();
  const personagemJogador: IPersonagem | undefined = useMemo(() => {
    return personagens?.find((personagem) =>
      personagem.tipop?.includes("personagem_jogavel")
    );
  }, [personagens]);

  // id que sera usado para fazer a query dos locais
  const { idRegiao } = useParams();

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

  const getInventario = async () => {
    try {
      const { data } = await api.get(
        `/inventario/${personagemJogador?.id_personagem}`
      );
      setInventario(data[0]);
    } catch (error) {
      console.error("Erro ao obter inventario:", error);
    }
  };

  const getItens = async () => {
    try {
      const { data } = await api.get(`/item`);
      setItemList(data);
    } catch (error) {
      console.error("Erro ao obter inventario:", error);
    }
  };

  useEffect(() => {
    getPersonagem();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedLocalId]);

  useEffect(() => {
    getInventario();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [personagemJogador]);

  useEffect(() => {
    getPersonagem();
    getLocais();
    getItens();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const local: ILocal | undefined = useMemo(() => {
    return locais.find((local) => local.idlocal === selectedLocalId);
  }, [locais, selectedLocalId]);

  const inventarioModalRef = useRef<HTMLDivElement>(null); // Tipagem correta para o ref
  const lojaModalRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      // Tipagem do evento
      if (
        inventarioModalRef.current &&
        !inventarioModalRef.current.contains(event.target as Node)
      ) {
        setInvertarioOpen(false);
      } else if (
        lojaModalRef.current &&
        !lojaModalRef.current.contains(event.target as Node)
      ) {
        setLojaOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  return (
    <WholePage>
      <Container>
        <Header>
          <BtnBack onClick={() => navigate(-1)}>Voltar</BtnBack>
          <h1>{`Local: ${
            locais.find((local) => local.idlocal === selectedLocalId)?.nomel ??
            "Sem local na região"
          }`}</h1>
        </Header>
        <Content>
          <LocalDetailsContainer>
            {local?.imgtexto === ""
              ? "Testando com texto porque o local nao tem descrição ainda, Testando com texto porque o local nao tem descrição ainda, Testando com texto porque o local nao tem descrição ainda Testando com texto porque o local nao tem descrição ainda, Testando com texto porque o local nao tem descrição ainda, Testando com texto porque o local nao tem descrição ainda"
              : local?.imgtexto}
          </LocalDetailsContainer>
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
          <SubMenoRow>
            <InventarioContainer onClick={() => setInvertarioOpen(true)}>
              Inventario
            </InventarioContainer>

            <LojistaContainer onClick={() => setLojaOpen(true)}>
              Lojista
            </LojistaContainer>
          </SubMenoRow>
          {invertarioOpen && inventario != null && (
            <div
              ref={inventarioModalRef}
              style={{
                position: "absolute",
                width: " 90%",
                height: " 90%",
                left: "5%",
                top: "5%",
              }}
            >
              <InventarioModal inventario={inventario} />
            </div>
          )}
          {lojaOpen && inventario != null && (
            <div
              ref={lojaModalRef}
              style={{
                position: "absolute",
                width: " 90%",
                height: " 90%",
                left: "5%",
                top: "5%",
              }}
            >
              <LojaModal inventario={inventario} itemList={itemList} />
            </div>
          )}
        </Content>
      </Container>
    </WholePage>
  );
};

export default Game;
