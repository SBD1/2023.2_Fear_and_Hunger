import { useEffect, useState } from "react";
import api from "../../api";
import { Container, RegiaoContainer, WholePage } from "./styles";

import { IRegiao } from "../../types";

export default function Regiao() {
  const [regioes, setRegioes] = useState<IRegiao[]>([]);
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

  console.log(regioes);

  return (
    <WholePage>
      <Container>
        {regioes?.map((regiao) => {
          return <RegiaoContainer>{regiao.nomer}</RegiaoContainer>;
        })}
      </Container>
    </WholePage>
  );
}
