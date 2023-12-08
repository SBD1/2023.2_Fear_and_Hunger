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
  flex-direction: column;
  width: 100%;
  height: 80%;
  justify-content: center;
`;

export const Footer = styled.div`
  display: flex;
  width: 100%;
  height: 10%;
  justify-content: flex-end;
  padding-right: 1.5rem;
`;

export const BtnSubmit = styled.button`
  width: 100%;
  height: 2.5rem;
  flex: 0 0 auto;
  cursor: pointer;
  border-radius: 10px;
  align-items: center;
  background-color: #2e2b28;
  font-weight: bold;
`;

export const ContainerItens = styled.form`
  display: flex;
  flex-direction: column;
  flex-direction: column;
  align-items: flex-start;
  gap: 1rem;
  margin: 0 auto;
  padding: 20px;
  border-radius: 5px;

  label {
    display: flex;
    align-items: center;
    input {
      margin-right: 1rem;
    }
  }
`;
