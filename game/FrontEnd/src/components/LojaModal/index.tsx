import { useState } from "react";
import { IInventario, Item } from "../../types";
import {
  Body,
  Footer,
  Header,
  ModalContainer,
  BtnSubmit,
  ContainerItens,
} from "./styles";
import api from "../../api";

interface ILojaModal {
  inventario: IInventario;
  itemList: Item[];
}

export default function LojaModal({ inventario, itemList }: ILojaModal) {
  const [selectedItemId, setSelectedItemId] = useState<number | null>(null);

  const handleRadioChange = (itemId: number) => {
    setSelectedItemId(itemId);
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (selectedItemId !== null) {
      await api
        .post(`/comprarItem/1/${selectedItemId}`)
        .then(() => alert("Item Comprado com Sucesso!")).then(() => window.location.reload());
    }
  };
  return (
    <ModalContainer>
      <Header>
        <h1>Loja</h1>
      </Header>
      <Body>
        <h1>Escolha os itens:</h1>
        <ContainerItens onSubmit={handleSubmit}>
          {itemList.map((item) => (
            <div key={item.iditem}>
              <label>
                <input
                  type="radio"
                  name="item"
                  value={item.iditem}
                  checked={selectedItemId === item.iditem}
                  onChange={() => handleRadioChange(item.iditem)}
                />
                {item.nome} - Valor: ${item.valor} - Peso: {item.peso}kg
              </label>
            </div>
          ))}
          <BtnSubmit type="submit">Enviar</BtnSubmit>
        </ContainerItens>
      </Body>

      <Footer>
        <h1>{`Seu Dinheiro: ${inventario?.dinatual}`}</h1>
      </Footer>
    </ModalContainer>
  );
}
