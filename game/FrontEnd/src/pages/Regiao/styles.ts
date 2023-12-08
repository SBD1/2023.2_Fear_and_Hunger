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
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  gap: 1%;
  border-radius: 10px;
  padding: 1%;
`;

export const RegiaoContainer = styled.div`
  display: flex;
  flex-direction: column;
  height: 30%;
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
`;
