import styled from "styled-components";

export const ModalContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  background-color: #1d1a17;
  box-sizing: border-box;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  border-radius: 10px;
`;

export const Header = styled.div`
  display: flex;
  width: 100%;
  height: 10%;
  justify-content: center;
  align-items: center;
`;

export const Body = styled.div`
  display: flex;
  width: 100%;
  height: 80%;
  justify-content: center;
  align-items: center;

  ul {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    align-content: space-between;
    list-style-type: none;
    padding: 0;
    gap: 1rem;
  }

  /* Estilo para cada item do inventário */
  li {
    border: 1px solid #45372e;
    background-color: #857c6e;
    border-radius: 5px;
    padding: 10px;
    margin: 10px 0;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  /* Estilo para os detalhes de cada item */
  strong {
    font-weight: bold;
  }

  /* Estilo para as datas de compra */
  strong:last-child {
    margin-top: 10px;
  }
`;

export const Footer = styled.div`
  display: flex;
  width: 100%;
  height: 10%;
  justify-content: space-evenly;
`;

export const Card = styled.div`
  display: flex;
  flex-direction: column;
  height: 40%;
  width: 30%;
  box-sizing: border-box;
  color: #f5f5f5;
  justify-content: center;
  align-items: center;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  border-radius: 10px;
  cursor: pointer;
  background-color: #1d1a17;

  padding: 2%;

  transition: transform 0.7s ease;

  &:hover {
    transform: scale(1.025);
    box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  }
`;
