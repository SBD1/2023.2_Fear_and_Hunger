import { useCallback, useEffect, useState } from "react";
import { GoArrowLeft } from "react-icons/go";
import { Link, useNavigate, useParams } from "react-router-dom";
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

  const navigator = useNavigate();

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
    partesPersonagemJogavel,
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

  const [isEnemyDead, setIsEnemyDead] = useState<boolean>(false);
  const [isPlayerDead, setIsPlayerDead] = useState<boolean>(false);

  const [battleMessage, setBattleMessage] = useState<string>("Sua vez!");

  // Função que simula um ataque do inimigo
  const ataqueInimigo = () => {
    // Informa ao jogador que o inimigo está atacando
    setBattleMessage("Inimigo atacando...");

    setTimeout(() => {
      // Realiza o ataque após uma pausa para a mensagem "Inimigo atacando..."
      const partesIdArray = partesPersonagemJogavel
        .filter((parte) => parte.hpatual > 0) // Filtra primeiro
        .map((parte) => parte.idparte);

      console.log(partesIdArray);

      const indiceAleatorio = Math.floor(Math.random() * partesIdArray.length);
      const parteEscolhida = partesPersonagemJogavel.find(
        (parte) => parte.idparte === partesIdArray[indiceAleatorio]
      );

      if (parteEscolhida && personagemJogavel?.atq && idPersonagemJogavel) {
        const probabilidadeAcertoInimigo = Number(parteEscolhida.probacerto);
        const sorteio = Math.random();

        if (sorteio <= probabilidadeAcertoInimigo) {
          // const danoInimigo = personagemJogavel.atq / 2;
          const danoInimigo = 50;
          const novoHpAtual = parteEscolhida.hpatual - danoInimigo;
          parteEscolhida.hpatual = novoHpAtual > 0 ? novoHpAtual : 0;
          atacar(parteEscolhida.idparte.toString(), novoHpAtual.toString());
          setBattleMessage(
            "Inimigo acertou sua " +
              parteEscolhida.tipoparte +
              " e causou " +
              danoInimigo +
              " de dano!"
          );

          const novoEstadoPartesPersonagem = partesPersonagemJogavel.map(
            (parte) => {
              if (parte.idparte === parteEscolhida.idparte) {
                return { ...parte, hpatual: parteEscolhida.hpatual };
              }
              return parte;
            }
          );

          const isPlayerNowDead = novoEstadoPartesPersonagem.some(
            (parte) =>
              (parte.tipoparte === "Cabeça" || parte.tipoparte === "Torso") &&
              parte.hpatual <= 0
          );

          setIsPlayerDead(isPlayerNowDead);

          if (isPlayerNowDead) {
            setYourTurn(false);
            setBattleMessage("Personagem Morto");
          } else {
            setTimeout(() => {
              setYourTurn(true);
              setBattleMessage("Sua vez!");
            }, 3000);
          }
        } else {
          setBattleMessage("Inimigo errou o ataque!");
          setTimeout(() => {
            setYourTurn(true);
            setBattleMessage("Sua vez!");
          }, 3000);
        }
      }
    }, 2000);
  };

  // Função que maneja o clique do botão de ataque do jogador
  const handleClick = (id: string) => {
    setYourTurn(false);

    const parte = partesInimigo.find(
      (parte) => parte.idparte.toString() === id
    );

    if (parte && personagemJogavel?.atq) {
      const probabilidadeAcerto = parseFloat(parte.probacerto);
      const sorteio = Math.random();

      if (sorteio <= probabilidadeAcerto) {
        const novoHpAtual = parte.hpatual - personagemJogavel.atq;
        parte.hpatual = novoHpAtual > 0 ? novoHpAtual : 0;
        atacar(id, novoHpAtual.toString());
        setBattleMessage(
          "Você acertou a " +
            parte.tipoparte +
            " do inimigo e causou " +
            personagemJogavel.atq +
            " de dano!"
        );

        const novoEstadoPartesInimigo = partesInimigo.map((parte) => {
          if (parte.idparte.toString() === id) {
            return { ...parte, hpatual: novoHpAtual };
          }
          return parte;
        });

        const isEnemyNowDead = novoEstadoPartesInimigo.some(
          (parte) =>
            (parte.tipoparte === "Cabeça" || parte.tipoparte === "Torso") &&
            parte.hpatual <= 0
        );

        setIsEnemyDead(isEnemyNowDead);

        if (isEnemyNowDead) {
          setBattleMessage("Inimigo Morto");
        } else {
          // Espera um segundo antes de simular o ataque do inimigo
          setTimeout(ataqueInimigo, 3000);
        }
      } else {
        setBattleMessage("Você errou o ataque!");
        setTimeout(ataqueInimigo, 3000);
      }
    }
  };

  useEffect(() => {
    if (
      partesInimigo.some(
        (parte) =>
          (parte.tipoparte === "Cabeça" || parte.tipoparte === "Torso") &&
          parte.hpatual <= 0
      )
    ) {
      setIsEnemyDead(true);
      setYourTurn(false);
    }

    if (
      partesPersonagemJogavel.some(
        (parte) =>
          (parte.tipoparte === "Cabeça" || parte.tipoparte === "Torso") &&
          parte.hpatual <= 0
      )
    ) {
      setIsPlayerDead(true);
      setYourTurn(false);
      navigator("/endgame");
    }
  }, [navigator, partesInimigo, partesPersonagemJogavel, atacar]);

  useEffect(() => {
    if (isPlayerDead) {
      navigator("/endgame");
    }
  }, [isPlayerDead, navigator]);

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
          <>
            {isEnemyDead ? (
              <h1>Inimigo Morto</h1>
            ) : (
              <>
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
                          disabled={!yourTurn || parte.hpatual <= 0}
                        >
                          Atacar
                        </button>
                      </div>
                    </div>
                  );
                })}
              </>
            )}
          </>
        </PersonagemContainer>
        <PersonagemContainer>
          <h1>Nome: {personagemJogavel.nome}</h1>
          <>
            {isPlayerDead ? (
              <h1>Personagem Morto</h1>
            ) : (
              <>
                {partesPersonagemJogavel.map((parte, idx) => {
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
                      </div>
                    </div>
                  );
                })}
              </>
            )}
          </>
        </PersonagemContainer>
        <div
          style={{
            display: "flex",
            width: "100%",
            height: "10%",
            position: "absolute",
            justifyContent: "center",
            alignItems: "center",
            bottom: 0,
          }}
        >
          <h1>{battleMessage}</h1>
        </div>
      </Container>
    </WholePage>
  );
}
