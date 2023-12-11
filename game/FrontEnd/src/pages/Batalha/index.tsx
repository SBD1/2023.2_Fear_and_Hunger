import { useCallback, useEffect, useState } from "react";
import { GoArrowLeft } from "react-icons/go";
import { Link, useParams } from "react-router-dom";
import api from "../../api";
import { IParte, IPersonagem, IPersonagemNaoJogavel } from "../../types";
import { ArrowLink } from "../Game/styles";
import { Container, PersonagemContainer, WholePage } from "./styles";

export default function Batalha() {
  const { idRegiao, idPersonagemJogavel, idInimigo } = useParams();

  const [personagemJogavel, setPersonagemJogavel] = useState<IPersonagem>(
    {} as IPersonagem
  );
  const [inimigo, setInimigo] = useState<IPersonagemNaoJogavel>(
    {} as IPersonagemNaoJogavel
  );

  const [yourTurn, setYourTurn] = useState<boolean>(true);

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

  const atacar = useCallback(async (idParte: string, newHp: string) => {
    try {
      const { data } = await api.put(`/parte/atualizar_hp/${idParte}/${newHp}`);
      console.log("Parte atacada", data);
    } catch (error) {
      console.error("Erro ao atacar parte:", error);
    }
  }, []);

  const ataqueInimigo = () => {
    setTimeout(() => {
      const partesIdArray = partesPersonagemJogavel.map(
        (parte) => parte.idparte
      );

      const indiceAleatorio = Math.floor(Math.random() * partesIdArray.length);
      const parteEscolhida = partesPersonagemJogavel.find(
        (parte) => parte.idparte === partesIdArray[indiceAleatorio]
      );

      if (parteEscolhida && personagemJogavel?.atq && idPersonagemJogavel) {
        const probabilidadeAcertoInimigo = Number(parteEscolhida.probacerto);

        const sorteio = Math.random();

        if (sorteio <= probabilidadeAcertoInimigo) {
          const danoInimigo = personagemJogavel.atq / 2; // Implemente esta função
          const novoHpAtual = parteEscolhida.hpatual - danoInimigo;

          parteEscolhida.hpatual = novoHpAtual > 0 ? novoHpAtual : 0;

          // Atualiza a parte atacada do jogador
          atacar(idPersonagemJogavel, novoHpAtual.toString());
        } else {
          // O ataque do inimigo erra
          console.log("O ataque do inimigo errou!");
        }
      }

      // Aqui você pode reabilitar o turno do jogador
      setYourTurn(true);
    }, 1000); // 1000 milissegundos (1 segundo) de atraso
  };

  const handleClick = (id: string) => {
    setYourTurn(false);

    const parte = partesInimigo.find(
      (parte) => parte.idparte.toString() === id
    );

    if (parte && personagemJogavel?.atq) {
      // Convertendo a probabilidade de string para número
      const probabilidadeAcerto = parseFloat(parte.probacerto);

      // Gerando um número aleatório entre 0 e 1
      const sorteio = Math.random();

      if (sorteio <= probabilidadeAcerto) {
        const novoHpAtual = parte.hpatual - personagemJogavel.atq;

        parte.hpatual = novoHpAtual > 0 ? novoHpAtual : 0;

        atacar(id, novoHpAtual.toString());

        ataqueInimigo();
      } else {
        console.log("O ataque errou!");
        ataqueInimigo();
      }
    }
  };

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

        <PersonagemContainer>
          <h1>Nome: {inimigo.nome}</h1>
          {partesInimigo.map((parte, idx) => {
            return (
              <div key={idx * 80}>
                <div
                  style={{
                    display: "flex",
                    justifyContent: "space-evenly",
                    alignItems: "center",
                  }}
                >
                  <p
                    style={{
                      width: "10em",
                      height: "5em",
                      display: "flex",
                      justifyContent: "center",
                      alignItems: "center",
                    }}
                  >{`${parte.tipoparte} ${parte.hpatual}`}</p>
                  <button
                    style={{ width: "10em", height: "5em" }}
                    onClick={() => handleClick(parte.idparte.toString())}
                    disabled={!yourTurn}
                  >
                    Atacar
                  </button>
                </div>
              </div>
            );
          })}
        </PersonagemContainer>
        <PersonagemContainer>
          <h1>Nome: {personagemJogavel.nome}</h1>
          {partesPersonagemJogavel.map((parte, idx) => {
            return (
              <div key={idx * 2}>
                <div
                  style={{
                    display: "flex",
                    justifyContent: "space-evenly",
                    alignItems: "center",
                  }}
                >
                  <p
                    style={{
                      width: "10em",
                      height: "5em",
                      display: "flex",
                      justifyContent: "center",
                      alignItems: "center",
                    }}
                  >{`${parte.tipoparte} ${parte.hpatual}`}</p>
                </div>
              </div>
            );
          })}
        </PersonagemContainer>
      </Container>
    </WholePage>
  );
}
