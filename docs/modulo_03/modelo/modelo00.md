## Mapeamento sistemático da modelagem

Este documento visa auxiliar as nossas correções e feedbacks do professor, além de rastrear as decisões tomadas pela equipe. 

Partes fragmentadas do nosso Diagrama Entidade Relacionamento (DER) e suas respectivas modelagens no Modelo Relacional são mostradas uma a uma, seguindo a ordem de passos do mapeamento do slide abaixo, visto em sala de aula. 


![Mapeamento entre esquema: os 7 passos do procedimento](./assets/slide08.png)

**Fonte:** Material da aula 08, pag 29. Sousa, Junior (2021) 

### Mapear todos os conjuntos de entidades (CE)
<list>
<details>
<summary>Entidade: Regiao</summary>


![Entidade Regiao](./assets/entidadeRegiao.png)

</details>

<details>
<summary>Entidade: Local</summary>


![Entidade Local](./assets/entidadeLocal.png)

</details>

<details>
<summary>Entidade: Personagem</summary>


![Entidade Personagem](./assets/entidadePersonagem.png)

</details>

<details>
<summary>Entidade: Parte </summary>


![Entidade Parte](./assets/entidadeParte.png)

</details>

<details>
<summary>Entidade: Personagem Nao Jogavel  </summary>


![Entidade Personagem Nao Jogavel](./assets/entidadePNJ.png)

</details>

<details>
<summary>Entidade: Inimigo  </summary>


![Entidade Inimigo](./assets/entidadeInimigo.png)

</details>

<details>
<summary>Entidade: Lojista </summary>


![Entidade Lojista](./assets/entidadeLojista.png)

</details>

<details>
<summary>Entidade: Instancia Inimigo  </summary>


![Entidade Instancia Inimigo](./assets/entidadeInstInimigo.png)

</details>

<details>
<summary>Entidade: Personagem Jogavel  </summary>


![Entidade Personagem Jogavel](./assets/entidadePJ.png)

</details>

<details>
<summary>Entidade: Inventario </summary>


![Entidade Inventario](./assets/entidadeInventario.png)

</details>

<details>
<summary>Entidade: Instancia Item</summary>


![Entidade Instancia Item](./assets/entidadeInstItem.png)

</details>

<details>
<summary>Entidade: Alma  </summary>


![Entidade Alma](./assets/entidadeAlma.png)

</details>

<details>
<summary>Entidade: Item</summary>


![Entidade Item](./assets/entidadeItem.png)

</details>

<details>
<summary>Entidade: Consumivel </summary>


![Entidade Consumivel](./assets/entidadeConsumivel.png)

</details>

<details>
<summary>Entidade: Legivel  </summary>


![Entidade Legivel](./assets/entidadeLegivel.png)

</details>

<details>
<summary>Entidade: Acessorio </summary>


![Entidade Acessorio](./assets/entidadeAcessorio.png)

</details>

<details>
<summary>Entidade: Arma  </summary>


![Entidade Arma](./assets/entidadeArma.png)

</details>

<details>
<summary>Entidade: Armadura </summary>


![Entidade Armadura](./assets/entidadeArmadura.png)

</details>

<details>
<summary>Entidade: Chave  </summary>


![Entidade Chave](./assets/entidadeChave.png)

</details>

<details>
<summary>Entidade:  Habilidade</summary>


![Entidade Habilidade](./assets/entidade.png)

</details>

<details>
<summary>Entidade: Ataque</summary>


![Entidade Ataque](./assets/entidadeAtaque.png)

</details>

<details>
<summary>Entidade: Passiva  </summary>


![Entidade](./assets/entidade.png)

</details>

<details>
<summary>Entidade: Suporte </summary>


![Entidade](./assets/entidade.png)

</details>

### Mapear todos os conjuntos de entidades fracas
<details>
<summary>Entidade fraca: Local esta contido em Regiao.</summary>


![Entidade Fraca Local](./assets/entidadeFracaLocal.png)

</details>

<details>
<summary>Entidade fraca: Instancia Inimigo eh referenciada por Inimigo.</summary>


![Entidade Fraca Instancia Inimigo](./assets/entidadeFracaInimigo.png)

</details>

<details>
<summary>Entidade fraca: Instancia Item eh referenciada por Item.</summary>


![Entidade Fraca Instancia Item](./assets/entidadeFracaItem.png)
</details>

<details>
<summary>Entidade fraca: Parte eh possuida por Personagem.</summary>


![Entidade Fraca Parte](./assets/entidadeFracaParte.png)
</details>

<details>
<summary>Entidade fraca: Inventario eh possuido por Personagem.</summary>


![Entidade Fraca Parte](./assets/entidadeFracaParte.png)
</details>
</list>

### Mapear todos os conjuntos de relacionamento (CR) de cardinalidade 1:1

1. Equipa?

### Mapear todos os conjuntos de relacionamento (CR) de cardinalidade 1:N

<details>
<summary>Relacionamento: Região contém Local</summary>

<details>
<summary>Relacionamento: Local contém Personagem</summary>

<details>
<summary>Relacionamento: Local contém “Instância Item”</summary>

<details>
<summary>Relacionamento: Personagem possui Parte</summary>

<details>
<summary>Relacionamento: Personagem possui Alma</summary>

<details>
<summary>Relacionamento: “Personagem Não Jogável” Armazena “Instância Item”</summary>
</details>

<details>
<summary>Relacionamento: Inimigo Referencia “Instância Inimigo”</summary>
</details>

<details>
<summary>Relacionamento: “Personagem Jogável” Possui Inventário</summary>
</details>

<details>
<summary>Relacionamento: Inventário Carrega “Instância Item”</summary>
</details>

<details>
<summary>Relacionamento: Item Referencia “Instância Item”</summary>
</details>

<details>
<summary>Relacionamento: Habilidade Possui Alma</summary>
</details>

### Mapear todos os conjuntos de relacionamento (CR) de cardinalidade N:N

<details>
<summary>Relacionamento: “Instancia Inimigo” contém “Instancia Item”</summary>
</details>

<details>    
<summary>Relacionamento: Lojista Vende “Instancia Item”</summary>
</details>

<details>
<summary>Relacionamento: “Personagem Jogável” Coleta “Alma”</summary>
</details>

### Mapear todos os conjuntos de relacionamento (CR) de grau maior ou igual a 3
O diagrama entidade-relacionamento nao possui relacionamento de grau maior ou igual a 3.

### Mapear todos os atributos multivalorados
O diagrama entidade-relacionamento nao possui atributos multivalorados.

### Mapear agregacao
O diagrama entidade-relacionamento nao possui agregacao.

### Mapear Generalizacao

<details>
<summary>Generalizacao: Personagem </summary>
</details>

<details>
<summary>Generalizacao: Personagem Nao Jogavel</summary>
</details>

<details>
<summary>Generalizacao: Item</summary>
</details>

<details>
<summary>Generalizacao: Habilidade</summary>
</details>
