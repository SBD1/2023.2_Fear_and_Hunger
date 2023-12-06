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
  background-color: #f5f5f5;
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
  height: 30%;
  width: 30%;
  box-sizing: border-box;
  color: #000;
  justify-content: center;
  align-items: center;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.75);
  border-radius: 10px;
  cursor: pointer;

  transition: transform 0.7s ease;

  &:hover {
    transform: scale(1.025);
    box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  }
`;
