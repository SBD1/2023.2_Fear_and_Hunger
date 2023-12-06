import React, { useEffect, useState } from "react";
import "./styles.css";
import api from "../../api";

interface Item {
  id_item: number;
  nome: string;
  valor: number;
}

const ItensForm: React.FC = () => {
  //   const itens: Item[] = [
  //     {
  //       id_item: 1,
  //       nome: "Espada de Ferro",
  //       valor: 200,
  //     },
  //     {
  //       id_item: 2,
  //       nome: "Poção de Cura",
  //       valor: 50,
  //     },
  //     {
  //       id_item: 3,
  //       nome: "Arco e Flecha",
  //       valor: 150,
  //     },
  //   ];

  const [itemSelecionado, setItemSelecionado] = useState<number | null>(null);
  const [itemSelecionadoRequest, setItemSelecionadoRequest] =
    useState<Item | null>(null);
  const [itens, setItens] = useState<Item[]>([]);

  useEffect(() => {
    // Fazendo a solicitação para o endpoint /lojista
    api
      .get("/lojista")
      .then((response) => setItens(response.data))
      .catch((error) => {
        console.error("Erro ao buscar itens:", error);
      });
  }, []);

  const handleSelecaoItem = (idItem: number) => {
    console.log(itens.find((item) => item.id_item === idItem));
    setItemSelecionado(idItem);
    setItemSelecionadoRequest(itens.find((item) => item.id_item === idItem)!);
  };

  const handleCompra = async () => {
    if (itemSelecionado !== null) {
      // Aqui você pode realizar a lógica de compra, enviar uma solicitação, exibir uma mensagem, etc.
      await api
        .post("/lojista", itemSelecionadoRequest)
        .then(() => alert(`Compra realizada para o item ${itemSelecionado}`))
        .catch((error) => {
          if (error.response.status) {
            alert(`Este item já esta no seu inventario! 🤨`);
          }
        });
      // alert(`Compra realizada para o item ${itemSelecionado}`);
    } else {
      alert("Por favor, selecione um item antes de comprar.");
    }
  };

  return (
    <>
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          minWidth: "fit-content",
          width: "25%",
          height: "70%",
          borderRadius: "10px",
          listStyle: "none",
          alignItems: "center",
          justifyContent: "space-around",
          boxShadow: "0px 0px 20px 0px rgba(0, 0, 0, 0.75)",
        }}
      >
        <h3 className="title-loja">Loja</h3>
        <form>
          {itens.map((item) => (
            <div key={item.id_item}>
              <label>
                <input
                  type="radio"
                  name="itens"
                  value={item.id_item}
                  checked={itemSelecionado === item.id_item}
                  onChange={() => handleSelecaoItem(item.id_item)}
                />
                {item.nome} - R${item.valor}
              </label>
            </div>
          ))}
        </form>
        <button
          className="btn-loja"
          onClick={handleCompra}
          disabled={itemSelecionado === null}
        >
          Comprar
        </button>
      </div>
    </>
  );
};

export default ItensForm;
