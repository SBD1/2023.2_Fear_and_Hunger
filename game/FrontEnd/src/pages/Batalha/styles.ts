import styled from "styled-components";

export const WholePage = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100svh;
  width: 100vw;
  box-sizing: border-box;
`;

export const Container = styled.div`
  display: flex;
  height: 80%;
  width: 80%;
  background-color: #1d1a17;
  box-sizing: border-box;
  border-radius: 10px;
  position: relative;
  padding-top: 4%;
`;

export const Header = styled.div`
  display: flex;
  height: 10%;
  width: 100%;
  justify-content: center;
  align-items: center;
`;

export const Content = styled.div`
  display: flex;
  height: 90%;
  width: 100%;
  justify-content: center;
  align-items: center;
  flex-direction: column;
`;

export const PersonagemContainer = styled.div`
  display: flex;
  flex-direction: column;
  width: 50%;
  height: fit-content;
  box-sizing: border-box;
`;
