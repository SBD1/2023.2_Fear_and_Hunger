import "./styles.css";
import logo from "../../assets/logo-fear-hunger.png";
import { Link } from "react-router-dom";
const Home = () => {
  return (
    <div className="container">
      <img src={logo} alt="Logo Fear And Hunger" />
      <p>
        Imagine-se em um mundo pós-apocalíptico, onde a fome e o medo são os
        únicos companheiros. Você está sozinho, e precisa encontrar comida e
        água para sobreviver. Mas o mundo está cheio de perigos. Criaturas
        mutantes, bandidos e até mesmo a própria natureza estão lá para matá-lo.
      </p>

      <p>
        Você precisa ser forte e inteligente para sobreviver. Você precisa
        construir abrigos, armas e ferramentas para se proteger. Você precisa
        explorar o mundo para encontrar recursos e descobrir os segredos que ele
        esconde.
      </p>

      <p>
        Em Fear and Hunger, você enfrentará os desafios mais difíceis da sua
        vida. Você terá que lutar pela sua sobrevivência, e só os mais fortes
        sobreviverão.
      </p>

      <Link className="btn-jogar" to="/personagem" preventScrollReset={true}>
        Jogar
      </Link>
    </div>
  );
};

export default Home;
