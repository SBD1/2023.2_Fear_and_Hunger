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
`;

export const Footer = styled.div`
  display: flex;
  width: 100%;
  height: 10%;
  justify-content: space-evenly;
`;
