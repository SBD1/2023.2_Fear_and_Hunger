import { useEffect, useState } from "react";
import api from "../../api";
import { Container, RegiaoContainer, WholePage } from "./styles";

import { IRegiao } from "../../types";
import { useNavigate } from "react-router-dom";

export default function Regiao() {
  const [regioes, setRegioes] = useState<IRegiao[]>([]);

  const navigate = useNavigate();

  const getRegioes = async () => {
    try {
      const { data } = await api.get("/regiao");
      setRegioes(data);
    } catch (error) {
      console.error("Erro ao obter personagens:", error);
    }
  };

  useEffect(() => {
    getRegioes();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleClick = (id: number) => {
    navigate(`/game/${id}`); // Redireciona para o caminho desejado
  };

  return (
    <WholePage>
      <Container>
        {regioes?.length === 0 ? (
          <div style={{ color: "#000" }}>No Data</div>
        ) : (
          <>
            {regioes?.map((regiao) => {
              return (
                <RegiaoContainer onClick={() => handleClick(regiao.idregiao)}>
                  {regiao.nomer}
                </RegiaoContainer>
              );
            })}
          </>
        )}
      </Container>
    </WholePage>
  );
}
