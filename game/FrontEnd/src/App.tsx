import { useEffect, useState } from "react";
import "./App.css";
import api from "./api";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Home from "./pages/Home";
import Game from "./pages/Game";

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
      element: <Home />,
    },
    {
      path: "/game",
      element: <Game/>,
    },
  ]);

  return (
    <>
      <RouterProvider router={router} />
      <p className="api">{data}</p>
    </>
  );
}

export default App;
