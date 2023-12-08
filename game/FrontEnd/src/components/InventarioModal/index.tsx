import { IInventario } from "../../types";
import { Body, Footer, Header, ModalContainer } from "./styles";

interface IIventarioModal {
  inventario: IInventario;
}

export default function InventarioModal({ inventario }: IIventarioModal) {  
  return (
    <ModalContainer>
      <Header>
        <h1>Inventário</h1>
      </Header>
      <Body></Body>

      <Footer>
        <h1>{`Itens: ${inventario?.capatual}`}</h1>
        <h1>{`Capacidade: ${inventario?.captotal}`}</h1>
        <h1>{`Dinheiro: ${inventario?.dinatual}`}</h1>
      </Footer>
    </ModalContainer>
  );
}
