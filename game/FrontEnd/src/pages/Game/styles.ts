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
  flex-direction: column;
  height: 80%;
  width: 80%;
  background-color: #1d1a17;
  box-sizing: border-box;
  gap: 1%;
  border-radius: 10px;
  padding: 1%;
`;

export const Header = styled.div`
  display: flex;
  width: 100%;
  height: 10%;
  justify-content: center;
  align-items: center;
`;

export const Content = styled.div`
  display: flex;
  width: 100%;
  height: 90%;
  align-items: center;
  justify-content: center;
  gap: 2%;
`;
