import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { Link, useParams } from "react-router-dom";
import api from "../../api";
import InventarioModal from "../../components/InventarioModal";
import LojaModal from "../../components/LojaModal";
import { IInventario, ILocal, IPersonagem, Item, ItemRPG } from "../../types";
import {
  ArrowLink,
  Container,
  Content,
  Header,
  InimigoContainer,
  InventarioContainer,
  LocaisCotaniner,
  LocaisList,
  LocalDetailsContainer,
  LocalRow,
  LojistaContainer,
  SubMenoRow,
  WholePage,
} from "./styles";

import { GoArrowLeft } from "react-icons/go";
import InimigoModal from "../../components/InimigoModal";

const Game = () => {
  const [invertarioOpen, setInvertarioOpen] = useState(false);
  const [lojaOpen, setLojaOpen] = useState(false);
  const [inimigoOpen, setInimigoOpen] = useState(false);

  const [personagens, setPersonagem] = useState<IPersonagem[]>([]);
  const [heroi, setHeroi] = useState<IPersonagem>();
  const [locais, setLocais] = useState<ILocal[]>([]);
  const [inventario, setInventario] = useState<IInventario>({} as IInventario);
  const [itemList, setItemList] = useState<Item[]>([]);
  const [itensComprados, setItensComprados] = useState<ItemRPG[]>([]);

  const [selectedLocalId, setSelectedLocalId] = useState<number | null>(null);

  //UseStete  para loja ou combate
  const [allowStore, setAllowStore] = useState(false);
  const [allowEnemy, setAllowEnemy] = useState(false);

  const { idRegiao, idPersonagemJogavel } = useParams();

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

  const getHero = useCallback(async () => {
    try {
      const { data } = await api.get(`/personagem/only/${idPersonagemJogavel}`);
      setHeroi(data[0]);
    } catch (error) {
      console.error("Erro ao obter personagem heroico:", error);
    }
  }, [idPersonagemJogavel]); // Dependências da função

  // Personagem disponiveis na região
  const getPersonagens = useCallback(async () => {
    try {
      const { data } = await api.get(`/personagem/${selectedLocalId}`);
      console.log(data);
      setAllowStore(
        data.some(
          (personagem: { tipop: string }) =>
            personagem.tipop === "personagem_nao_jogavel"
        )
      );
      setAllowEnemy(false);
      setPersonagem(data);
    } catch (error) {
      console.error("Erro ao obter personagens:", error);
    }
  }, [selectedLocalId]); // Dependências da função

  const getInventario = async () => {
    try {
      const { data } = await api.get(`/inventario/${idPersonagemJogavel}`);
      setInventario(data[0]);
    } catch (error) {
      console.error("Erro ao obter inventario:", error);
    }
  };

  const getItensComprados = async () => {
    try {
      const { data } = await api.get("comprarItem/inventario");
      console.log(data);
      setItensComprados(data);
    } catch (error) {
      console.error("Erro ao obter itens comprados:", error);
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

  const movePersonagemJogavel = useCallback(async () => {
    try {
      await api.put(
        `/personagem/move/${idPersonagemJogavel}/${selectedLocalId}`
      );
    } catch (error) {
      console.error("Erro ao mover personagem:", error);
    }
  }, [idPersonagemJogavel, selectedLocalId]);

  useEffect(() => {
    getPersonagens();
    movePersonagemJogavel();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedLocalId]);

  useEffect(() => {
    getInventario();
    getItensComprados();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [heroi]);

  useEffect(() => {
    getHero();
    if (personagens.length === 0) {
      getPersonagens();
    }

    if (locais.length === 0) {
      getLocais();

      if (itemList.length === 0) {
        getItens();
      }
    }
  }, [
    getHero,
    getLocais,
    getPersonagens,
    itemList.length,
    locais.length,
    personagens.length,
  ]);

  const local: ILocal | undefined = useMemo(() => {
    return locais.find((local) => local.idlocal === selectedLocalId);
  }, [locais, selectedLocalId]);

  const inventarioModalRef = useRef<HTMLDivElement>(null); // Tipagem correta para o ref
  const lojaModalRef = useRef<HTMLDivElement>(null);
  const InimigoModalRef = useRef<HTMLDivElement>(null);

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
      } else if (
        InimigoModalRef.current &&
        !InimigoModalRef.current.contains(event.target as Node)
      ) {
        setInimigoOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  return (
    <WholePage>
      <Link to={`/regiao/${idPersonagemJogavel}`}>
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
          <SubMenoRow>
            <InventarioContainer
              onClick={() =>
                setInvertarioOpen(
                  heroi === undefined ? invertarioOpen : !invertarioOpen
                )
              }
            >
              Inventario
            </InventarioContainer>

            {allowStore && (
              <LojistaContainer onClick={() => setLojaOpen(true)}>
                Lojista
              </LojistaContainer>
            )}

            {allowEnemy && (
              <InimigoContainer onClick={() => setInimigoOpen(true)}>
                Combate
              </InimigoContainer>
            )}
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
              <InventarioModal
                inventario={inventario}
                inventarioItens={itensComprados}
              />
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

          {inimigoOpen && (
            <div
              ref={InimigoModalRef}
              style={{
                position: "absolute",
                width: " 90%",
                height: " 90%",
                left: "5%",
                top: "5%",
              }}
            >
              <InimigoModal />
            </div>
          )}
        </Content>
      </Container>
    </WholePage>
  );
};

export default Game;
