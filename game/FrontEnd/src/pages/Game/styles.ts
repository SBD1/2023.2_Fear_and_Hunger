import styled from "styled-components";

export const WholePage = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100svh;
  width: 100vw;
  box-sizing: border-box;
  position: relative;
`;

export const ArrowLink = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 4%;
  height: 6%;
  position: absolute;
  top: 3%;
  left: 2%;
  cursor: pointer;
  border-radius: 10px;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  color: #f5f5f5;

  transition: transform 0.7s ease;

  &:hover {
    transform: scale(1.05);
    box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  }
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

  h1 {
    flex: 1;
  }
`;

export const Content = styled.div`
  display: flex;
  width: 100%;
  height: 90%;
  gap: 2%;
  position: relative;
`;

export const LocaisCotaniner = styled.div`
  display: flex;
  flex-direction: column;
  width: 15%;
  height: 50%;
  position: absolute;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  border-radius: 10px;
  right: 0;
  bottom: 0;
  box-sizing: border-box;
  padding: 1%;
`;

interface ILocalRow {
  isSelected: boolean;
}

export const LocalRow = styled.div<ILocalRow>`
  display: flex;
  width: 100%;
  max-height: 33%;
  min-height: 20%;
  justify-content: center;
  border-radius: 10px;
  align-items: center;
  background-color: ${({ isSelected }) => (isSelected ? "#2e2b28" : "")};
  cursor: pointer;

  transition: background-color 0.5s;
`;

export const LocaisList = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
`;

export const LocalDetailsContainer = styled.div`
  display: flex;
  width: 100%;
  height: 50%;
  box-sizing: border-box;
  justify-content: center;
  align-items: center;
`;

export const SubMenoRow = styled.div`
  display: flex;
  flex-direction: row;
  width: 83%;
  height: 10%;
  gap: 1rem;
  position: absolute;
  left: 0;
  bottom: 0;
  box-sizing: border-box;
`;

export const InventarioContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 15%;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  border-radius: 10px;
  left: 0;
  bottom: 0;
  box-sizing: border-box;
  cursor: pointer;
`;

export const LojistaContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 15%;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  border-radius: 10px;
  left: 0;
  bottom: 0;
  box-sizing: border-box;
  cursor: pointer;
`;

export const InimigoContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  width: 15%;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.75);
  border-radius: 10px;
  left: 0;
  bottom: 0;
  box-sizing: border-box;
  cursor: pointer;
`;
