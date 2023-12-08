import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { Link, useParams } from "react-router-dom";
import api from "../../api";
import { IInventario, ILocal, IPersonagem } from "../../types";
import {
  ArrowLink,
  Container,
  Content,
  Header,
  InventarioContainer,
  LocaisCotaniner,
  LocaisList,
  LocalDetailsContainer,
  LocalRow,
  WholePage,
} from "./styles";
import InventarioModal from "../../components/InventarioModal";

import { GoArrowLeft } from "react-icons/go";

const Game = () => {
  const [invertarioOpen, setInvertarioOpen] = useState(false);
  const [personagens, setPersonagem] = useState<IPersonagem[]>([]);
  const [locais, setLocais] = useState<ILocal[]>([]);
  const [inventario, setInventario] = useState<IInventario>({} as IInventario);

  const [selectedLocalId, setSelectedLocalId] = useState<number | null>(null);

  const personagemJogador: IPersonagem | undefined = useMemo(() => {
    return personagens?.find((personagem) =>
      personagem.tipop?.includes("personagem_jogavel")
    );
  }, [personagens]);

  // id que sera usado para fazer a query dos locais
  const { idRegiao } = useParams();

  const getLocais = useCallback(async () => {
    try {
      const { data } = await api.get(`/local/${idRegiao}`);
      setLocais(data);

      if (selectedLocalId === null) {
        setSelectedLocalId(data[0]?.idlocal);
      }
    } catch (error) {
      console.error("Erro ao obter locais:", error);
    }
  }, [idRegiao, selectedLocalId]); // Dependências da função

  const getPersonagens = useCallback(async () => {
    try {
      const { data } = await api.get(`/personagem/${selectedLocalId}`);
      setPersonagem(data);
    } catch (error) {
      console.error("Erro ao obter personagens:", error);
    }
  }, [selectedLocalId]); // Dependências da função

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

  useEffect(() => {
    getPersonagens();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedLocalId]);

  useEffect(() => {
    getInventario();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [personagemJogador]);

  useEffect(() => {
    if (personagens.length === 0) {
      getPersonagens();
    }

    if (locais.length === 0) {
      getLocais();
    }
  }, [getLocais, getPersonagens, locais.length, personagens.length]);

  const local: ILocal | undefined = useMemo(() => {
    return locais.find((local) => local.idlocal === selectedLocalId);
  }, [locais, selectedLocalId]);

  const inventarioModalRef = useRef<HTMLDivElement>(null); // Tipagem correta para o ref

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      // Tipagem do evento
      if (
        inventarioModalRef.current &&
        !inventarioModalRef.current.contains(event.target as Node)
      ) {
        setInvertarioOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  return (
    <WholePage>
      <Link to="/regiao">
        <ArrowLink>
          <GoArrowLeft />
        </ArrowLink>
      </Link>
      <Container>
        <Header>
          <h1>{`Local: ${
            locais.find((local) => local.idlocal === selectedLocalId)?.nomel ??
            "Sem local na região"
          }`}</h1>
        </Header>
        <Content>
          <LocalDetailsContainer>
            {local?.imgtexto === "" ? "Sem Descrição" : local?.imgtexto}
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
          <InventarioContainer
            onClick={() =>
              setInvertarioOpen(
                personagemJogador === undefined
                  ? invertarioOpen
                  : !invertarioOpen
              )
            }
          >
            Inventario
          </InventarioContainer>
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
        </Content>
      </Container>
    </WholePage>
  );
};

export default Game;
