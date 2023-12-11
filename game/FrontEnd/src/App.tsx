import { useEffect, useState } from "react";
import { RouterProvider, createBrowserRouter } from "react-router-dom";
import "./App.css";
import api from "./api";
import Batalha from "./pages/Batalha";
import Game from "./pages/Game";
import Home from "./pages/Home";
import Personagem from "./pages/Personagem";
import Regiao from "./pages/Regiao";
import EndGame from "./pages/EndGame";

function App() {
  // const [count, setCount] = useState(0);
  const [data, setData] = useState("");

  const testApi = async () => {
    const { data } = await api.get("/");
    setData(data.message);
  };

  useEffect(() => {
    testApi();
  }, []);

  const router = createBrowserRouter([
    {
      path: "/",
      element: (
        <>
          <Home />
          <p className="api">{data}</p>
        </>
      ),
    },
    {
      path: "/personagem",
      element: <Personagem />,
    },
    {
      path: "/regiao/:idPersonagemJogavel",
      element: <Regiao />,
    },
    {
      path: "/game/:idRegiao/:idPersonagemJogavel",
      element: <Game />,
    },
    {
      path: "/batalha/:idRegiao/:idPersonagemJogavel/:idInimigo",
      element: <Batalha />,
    },
    {
      path: "/endgame",
      element: <EndGame />,
    },
  ]);

  return (
    <>
      <RouterProvider router={router} />
    </>
  );
}

export default App;
