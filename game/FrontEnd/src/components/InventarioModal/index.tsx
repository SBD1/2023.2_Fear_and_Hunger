import { IInventario, ItemRPG } from "../../types";
import { Body, Footer, Header, ModalContainer } from "./styles";

interface IIventarioModal {
  inventario: IInventario;
  inventarioItens: ItemRPG[];
}

export default function InventarioModal({
  inventario,
  inventarioItens,
}: IIventarioModal) {
  return (
    <ModalContainer>
      <Header>
        <h1>Inventário</h1>
      </Header>
      <Body>
        <ul>
          {inventarioItens?.map((item, index) => (
            <li key={index}>
              <strong>Nome: </strong>
              {item.nome}
              <br />
              <strong>Quantidade: </strong>
              {item.quantidade}
              <br />
              <strong>Valor Total: </strong>
              {item.valortotal}
              <br />
              <strong>Data de Compra: </strong>
              {new Date(item.datacompra).toLocaleString()}
              <br />
            </li>
          ))}
        </ul>
      </Body>

      <Footer>
        <h1>{`Itens: ${inventario?.capatual}`}</h1>
        <h1>{`Capacidade: ${inventario?.captotal}`}</h1>
        <h1>{`Dinheiro: ${inventario?.dinatual}`}</h1>
      </Footer>
    </ModalContainer>
  );
}
