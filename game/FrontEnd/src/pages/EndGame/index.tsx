import { Container, WholePage } from "./styles";

import { GoArrowLeft } from "react-icons/go";
import { Link } from "react-router-dom";
import { ArrowLink } from "../Game/styles";

export default function EndGame() {
  return (
    <WholePage>
      <Link to="/">
        <ArrowLink>
          <GoArrowLeft />
        </ArrowLink>
      </Link>
      <Container>
        <h1>SE FODEU</h1>
      </Container>
    </WholePage>
  );
}
