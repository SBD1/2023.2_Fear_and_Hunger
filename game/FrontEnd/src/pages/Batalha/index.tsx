import { GoArrowLeft } from "react-icons/go";
import { Link, useParams } from "react-router-dom";
import { ArrowLink } from "../Game/styles";
import {
  Container,
  InimigoContainer,
  PersonagemContainer,
  WholePage,
} from "./styles";
import { IParte, IPersonagemJogavel, IPersonagemNaoJogavel } from "../../types";
import { useState, useCallback, useEffect } from "react";
import api from "../../api";

export default function Batalha() {
  const { idRegiao, idPersonagemJogavel, idInimigo } = useParams();

  const [personagemJogavel, setPersonagemJogavel] =
    useState<IPersonagemJogavel>({} as IPersonagemJogavel);
  const [inimigo, setInimigo] = useState<IPersonagemNaoJogavel>(
    {} as IPersonagemNaoJogavel
  );

  const [partesInimigo, setPartesInimigo] = useState<IParte[]>([]);

  const [partesPersonagemJogavel, setPartesPersonagemJogavel] = useState<
    IParte[]
  >([]);

  const getInimigo = useCallback(async () => {
    const { data } = await api.get(`/personagem_nao_jogavel/id/${idInimigo}`);
    setInimigo(data[0]);
  }, [idInimigo]);

  const getPersonagemJogavel = useCallback(async () => {
    try {
      const { data } = await api.get(`/personagem/only/${idPersonagemJogavel}`);
      setPersonagemJogavel(data[0]);
    } catch (error) {
      console.error("Erro ao obter personagem heroico:", error);
    }
  }, [idPersonagemJogavel]); // Dependências da função

  const getPartesInimigo = useCallback(async () => {
    try {
      const { data } = await api.get(`/partes/${idInimigo}`);
      setPartesInimigo(data);
    } catch (error) {
      console.error("Erro ao obter partes do inimigo:", error);
    }
  }, [idInimigo]); // Dependências da função

  const getPartesPersonagem = useCallback(async () => {
    try {
      const { data } = await api.get(`/partes/${idPersonagemJogavel}`);
      setPartesPersonagemJogavel(data);
    } catch (error) {
      console.error("Erro ao obter partes do inimigo:", error);
    }
  }, [idPersonagemJogavel]); // Dependências da função

  useEffect(() => {
    if (Object.keys(inimigo).length === 0) {
      getInimigo();
    }

    if (Object.keys(personagemJogavel).length === 0) {
      getPersonagemJogavel();
    }

    if (partesInimigo.length === 0) {
      getPartesInimigo();
    }

    if (partesPersonagemJogavel.length === 0) {
      getPartesPersonagem();
    }
  }, [
    getInimigo,
    getPartesInimigo,
    getPartesPersonagem,
    getPersonagemJogavel,
    idInimigo,
    inimigo,
    partesInimigo.length,
    partesPersonagemJogavel.length,
    personagemJogavel,
  ]);

  return (
    <WholePage>
      <Link to={`/game/${idRegiao}/${idPersonagemJogavel}`}>
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
          <h1>Batalha</h1>
        </div>

        <InimigoContainer>
          <h1>Nome: {inimigo.nome}</h1>
          {partesInimigo.map((parte) => {
            return (
              <div>
                <p>{` ${parte.tipoparte} ${parte.hpatual}`}</p>
              </div>
            );
          })}
        </InimigoContainer>
        <PersonagemContainer>
          <h1>Nome: {personagemJogavel.nome}</h1>
          {partesPersonagemJogavel.map((parte) => {
            return (
              <div>
                <p>{` ${parte.tipoparte} ${parte.hpatual}`}</p>
              </div>
            );
          })}
        </PersonagemContainer>
      </Container>
    </WholePage>
  );
}
