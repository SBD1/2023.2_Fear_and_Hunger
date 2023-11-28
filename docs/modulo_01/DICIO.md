### Versionamento

| Versão | Data       | Modificação                                  | Autor                               | Revisor(es) |
| ------ | ---------- | -------------------------------------------- | ----------------------------------- | ----------- |
| 1.0    | 16/09/2023 | Criação do Documento                         | Pedro Lima                          | -           |
| 1.1    | 24/09/2023 | Criação do modelo de tabela                  | Pedro, Matheus, Alexandre, Gabriela | -           |
| 1.2    | 02/10/2023 | Adicionando tabelas                          | Matheus                             | Gabriela    |
| 1.2.1  | 02/10/2023 | Pequenas Correções                           | Matheus                             | Gabriela    |
| 1.3    | 02/10/2023 | Removendo tabelas que foram removidas no MER | Matheus                             | Gabriela    |
| 1.4    | 30/10/2023 | Atualizando tabelas conforme a nova versão do MER | Gabriela                            | Matheus    |
| 1.4.1    | 30/10/2023 | Atualizando tabelas conforme a nova versão do MER | Gabriela                            | Matheus    |

## Tabela : **Personagem**

|                 |                    |     |     |     |     |
| --------------- | ------------------ | --- | --- | --- | --- |
| **Descrição**   | Personagem jogável, que o usuário do jogo irá utilizar |     |     |     |     |
| **Observações** | -                  |     |     |     |     |

| Nome          | Descrição                         | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------- | --------------------------------- | ------------ | ------- | --------------------- |
| idPersonagem | Identificador único de Personagem | int          | 4       | PK           |
| alma          | Valor do atributo de alma         | int          | 4       | DEFAULT     |
| local         | Valor do atributo de agilidade    | int          | 4       | UNIQUE               |
| tipoP        | Tipo do personagem (PC ou NPC)    | int          | 4       | NOT NULL     |

## Tabela : **Ataque**

|                 |                                     |     |     |     |
| --------------- | ----------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações de ataques |     |     |     |
| **Observações** | Possui chave estrangeira referenciando a tabela Habilidade.                                   |     |     |     |

| Nome         | Descrição                                                      | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | -------------------------------------------------------------- | ------------ | ------- | ---------------------- |
| idAtaque     | Identificador único do ataque                                  | int          | 4       | PK   |
| tipoAtaque   | Tipo de ataque                                                 | int          | 4       | NOT NULL |
| descrição    | Descrição do ataque                                            | varchar      | 255     | DEFAULT              |
| idHabilidade | Chave estrangeira referenciando o identificador da tabela Habilidade | varchar      | 255     | FK   |
| danoFisico   | Dano físico referente ao ataque                                | int          | 4       | DEFAULT       |
| danoMagico   | Dano mágico referente ao ataque                                | int          | 4       | DEFAULT       |

## Tabela : **Item**

|                 |                                            |     |     |     |
| --------------- | ------------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações de todos os itens |     |     |     |
| **Observações** | Contém duas chaves estrangeiras referenciando os identificadores das tabelas Inventario e Lojista                                          |     |     |     |

| Nome         | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | -------------------------------------------------------- | ------------ | ------- | ---------------------- |
| idItem       | Chave estrangeira referenciando o identificador item            | int          | 4       | PK   |
| tipo         | Qual é o tipo desse item                                 | varchar      | 255     | NOT NULL |
| idInventario | Chave estrangeira referenciando o identificador da tabela Inventario | int          | 4       | FK          |
| lojista      | Chave estrangeira referenciando o identificador da tabela Lojista    | int          | 4       | FK         |

## Tabela : **Armadura**

|                 |                                            |     |     |     |
| --------------- | ------------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações do item tido como "armadura" |     |     |     |
| **Observações** | Possui chave estrangeira referenciando a tabela Item                                          |     |     |     |

| Nome         | Descrição                                                 | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | --------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem       | Chave estrangeira referenciando o identificador da entidade Item | int          | 4       | FK  |
| defesa       | Quanto de defesa esse item agrega ao personagem           | int          | 4       | DEFAULT      |
| defesaMagica | Quanto de defesa mágica esse item agrega ao personagem    | int          | 4       | DEFAULT      |
| agilidade    | Quanto de agilidade esse item agrega ao personagem        | int          | 4       | DEFAULT      |
| descrição    | Descrição da armadura                                     | varchar      | 255     | DEFAULT      |
| valor        | Valor da armadura                                         | int          | 4       | DEFAULT      |
| nome         | Nome da armadura                                          | varchar      | 255     | NOT NULL      |

## Tabela : **Arma**

|                 |                                        |     |     |     |
| --------------- | -------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações do item tido como "arma" |     |     |     |
| **Observações** | Possui chave estrangeira referenciando a tabela Item                                      |     |     |     |

| Nome         | Descrição                                                      | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | -------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem       | Chave estrangeira referenciando o identificador da entidade Item      | int          | 4       | FK  |
| ataqueFisico | Quanto de dano de ataque fisico essa arma agrega ao personagem | int          | 4       | DEFAULT      |
| ataqueMagico | Quanto de dano de ataque magico essa arma agrega ao personagem | int          | 4       | DEFAULT      |
| descrição    | Descrição da armadura                                          | varchar      | 255     | DEFAULT     |
| valor        | Valor da armadura                                              | int          | 4       | DEFAULT     |
| nome         | Nome da armadura                                               | varchar      | 255     | NOT NULL      |

## Tabela : **Acessório**

|                 |                                             |     |     |     |
| --------------- | ------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações do item tido como "acessório" |     |     |     |
| **Observações** | Possui chave estrangeira referenciando a tabela Item                                           |     |     |     |

| Nome         | Descrição                                                           | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem       | Chave estrangeira referenciando o idItem da entidade Item           | int          | 4       | FK  |
| defesa       | Quanto de defesa esse item agrega ao personagem                     | int          | 4       | DEFAULT      |
| defesaMagica | Quanto de defesa mágica esse item agrega ao personagem              | int          | 4       | DEFAULT       |
| agilidade    | Quanto de agilidade esse item agrega ao personagem                  | int          | 4       | DEFAULT       |
| ataqueFisico | Quanto de dano de ataque fisico esse acessório agrega ao personagem | int          | 4       | DEFAULT       |
| ataqueMagico | Quanto de dano de ataque magico esse acessório agrega ao personagem | int          | 4       | DEFAULT       |
| descrição    | Descrição da armadura                                               | varchar      | 255     | DEFAULT       |
| valor        | Valor da armadura                                                   | int          | 4       | DEFAULT       |
| nome         | Nome da armadura                                                    | varchar      | 255     | NOT NULL      |

## Tabela : **Lojista**

|                 |                                      |     |     |     |
| --------------- | ------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações da Lojista |     |     |     |
| **Observações** | Contém chave estrangeira referenciando a tabela Inventário                                    |     |     |     |

| Nome         | Descrição                                                     | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idLojista    | Chave primaria única do lojista                               | int          | 4       | PK  |
| idInventario | Chave estrangeira referenciando o identificador da tabela Inventário | int          | 4       | FK  |
| agilidade     | Valor do atributo de agilidade     | int          | 4       |DEFAULT |
| defesaMagica     | Valor do atributo de defesaMagica     | int          | 4       | DEFAULT |
| defesa     | Valor do atributo de defesa     | int          | 4       |DEFAULT | 
| ataque     | Valor do atributo de ataque     | int          | 4       |DEFAULT | 
| nome         | Nome do lojista                                               | varchar      | 255     | NOT NULL      |

## Tabela : **Personagem Não Jogável**

|                 |                                                     |     |     |     |
| --------------- | --------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações de Personagem Não Jogável |     |     |     |
| **Observações** | Contém chave estrangeira referenciando a tabela Personagem                                                   |     |     |     |

| Nome         | Descrição                                                     | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idPersonagem | Chave estrangeira referenciando o identificador da tabela Personagem | varchar      | 255     | FK  |
| tipoPnj | Atributo que determina o tipo do personagem não jogável, se é lojista ou inimigo | varchar      | 255     | NOT NULL  |

## Tabela : **Inimigo**

|                 |                                      |     |     |     |
| --------------- | ------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações de Inimigo |     |     |     |
| **Observações** | -                                    |     |     |     |

| Nome          | Descrição                          | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------- | ---------------------------------- | ------------ | ------- | --------------------- |
| idPersonagem | Identificador único de Personagem  | int          | 4       | PK           |
| nome          | Nome do personagem                 | varchar      | 255     | NOT NULL    |
| ataque        | Valor do atributo de ataque        | int          | 4       | DEFAULT               |
| defesa        | Valor do atributo de defesa        | int          | 4       | DEFAULT               |
| defesaMagica | Valor do atributo de defesa magica | int          | 4       | DEFAULT               |
| agilidade     | Valor do atributo de agilidade     | int          | 4       | DEFAULT              |


## Tabela : **Legível**

|                 |                                                    |     |     |     |
| --------------- | -------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Item Legível                                       |     |     |     |
| **Observações** | - |     |     |     |

| Nome      | Descrição                               | Tipo de Dado | Tamanho | Restrições de domínio |
| --------- | --------------------------------------- | ------------ | ------- | --------------------- |
| idItem   | Chave primária para itens legiveis         | int          | 4       | PK           |
| Nome      | Nome do item                            | varchar      | 255     | NOT NULL     |
| Descrição | Informação básica sobre o item legível. | varchar      | 255     | DEFAULT                |
| Conteúdo  | Texto ou informações contidas no item.  | varchar      | 255     | DEFAULT                |             |
| Valor     | Valor do item para ser comprado         | int      | 4     | DEFAULT                |

## Tabela : **Consumível**

|                 |                                                                       |     |     |     |
| --------------- | --------------------------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Item consumível que pode recuperar HP ou sanidade mental, curar infecções ou sangramento                                                      |     |     |     |
| **Observações** |  |     |     |     |

| Nome      | Descrição                                 | Tipo de Dado | Tamanho | Restrições de domínio |
| --------- | ----------------------------------------- | ------------ | ------- | --------------------- |
| idItem   | Chave primária para itens consumíveis             | int          | 4       | PK           |
| adHp   | Quantidade de HP que o item adiciona             | int          | 4       | NOT NULL           |
| adMente   | Quantidade de pontos no atributo mente de personagem que o item adiciona             | int          | 4       | NOT NULL           |
| nome      | Nome do item                              | varchar      | 255     | NOT NULL     |
| descrição | Descrição do item consumível e seu efeito | varchar      | 255     | DEFAULT               |
| valor     | Valor do item para ser comprado           | int      | 4     | DEFAULT               |


## Tabela : **Inventario**

|                 |                                                    |     |     |     |
| --------------- | -------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados do inventário.                   |     |     |     |
| **Observações** | Contem chave estrangeira referenciando Personagem. |     |     |     |

| Nome         | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------- | ------------ | ------- | --------------------- |
| idInventario | Código de identificação do inventário.      | int          | 4       | PK                    |
| idPersonagem | Chave Estrangeira referenciando Personagem. | int          | 4       | FK           |

## Tabela : **Alma**

|                 |                                                    |     |     |     |
| --------------- | -------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados de classe do personagem.         |     |     |     |
| **Observações** | Contem chave estrangeira referenciando Personagem. |     |     |     |

| Nome       | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ---------- | ------------------------------------------- | ------------ | ------- | --------------------- |
| nome       | Identifica a classe do personagem           | varchar      | 255     | PK                    |
| personagem | Chave Estrangeira referenciando Personagem. | int          | 4       | FK           |

## Tabela : **Personagem Jogável**

|                 |                                                                                                                         |     |     |     |
| --------------- | ----------------------------------------------------------------------------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados do personagem jogável.                                                                                |     |     |     |
| **Observações** | Contem Chave Estrangeira referenciando as tabelas Personagem e Item |     |     |     |

| Nome         | Descrição                                                 | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | --------------------------------------------------------- | ------------ | ------- | --------------------- |
| corpo        | Valor do atributo corpo do personagem   | int          | 4       | NOT NULL              |
| mente        | Valor do atributo mente do personagem   | int          | 4       | NOT NULL              |
| defesa       | Valor do atributo defesa do personagem   | int          | 4       | NOT NULL              |
| agilidade        | Valor do atributo agilidade do personagem   | int          | 4       | NOT NULL              |
| ataque       | Valor do atributo ataque do personagem   | int          | 4       | NOT NULL              |
| nome       | Nome do personagem   | varchar          | 255       | NOT NULL              |
| defesaMagica       | Valor do atributo defesa mágica do personagem   | int          | 4       | NOT NULL              |
| idPersonagem | Chave Estrangeira referenciando a tabela Personagem | int          | 4       | FK            |
| acessorio1   | Chave Estrangeira referenciando a tabela Item         | int          | 4       | FK                    |
| acessorio2   | Chave Estrangeira referenciando a tabela Item          | int          | 4       | FK                    |
| arma         | Chave Estrangeira referenciando a tabela Item              | int          | 4       | FK                    |
| armadura     | Chave Estrangeira referenciando a tabela Item           | int          | 4       | FK                    |

## Tabela : **Habilidade**

|                 |                                              |     |     |     |
| --------------- | -------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados de habilidades.            |     |     |     |
| **Observações** | Contém Chave Estrangeira referenciando alma. |     |     |     |

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idHabilidade | Identificador da habilidade.                                                             | int          | 4       | PK                    |
| custo        | Armazena quantos recursos de mente são necessários para realização de alguma habilidade. | int          | 4       | NOT NULL      |
| alma         | Chave Estrangeira referenciando alma.                                                    | int          | 4       | FK                    |

## Tabela : **Genital**

|                 |                                              |     |     |     |
| --------------- | -------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados da parte do corpo "Genital"           |     |     |     |
| **Observações** | Contém Chave Estrangeira referenciando a tabela Personagem. |     |     |     |

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte | Identificador da parte da genital do personagem                                                             |     int      | 4       | PK                    |
| Personagem        | Chave estrangeira referenciando a tabela Personagem | int          | 4       | FK      |
| tipoParte         | Identificador do tipo da parte.                                                    | int         | 4       | UNIQUE                  |
| hpMaximo       | Quantidade máxima de pontos de vida que a parte possui                                                    |      int     | 4       | NOT NULL                    |
| hpAtual        | Quantidade de pontos de vida que a parte possui no momento                                                   |     int      | 4       | NOT NULL 

## Tabela : **Cabeça**

|                 |                                              |     |     |     |
| --------------- | -------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados da parte do corpo "Cabeça"           |     |     |     |
| **Observações** | Contém Chave Estrangeira referenciando a tabela Personagem. |     |     |     |

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte | Identificador da parte da cabeça do personagem                                                             |     int      | 4       | PK                    |
| Personagem        | Chave estrangeira referenciando a tabela Personagem | int          | 4       | FK      |
| tipoParte         | Identificador do tipo da parte.                                                    | int         | 4       | UNIQUE                  |
| hpMaximo       | Quantidade máxima de pontos de vida que a parte possui                                                    |      int     | 4       | NOT NULL                    |
| hpAtual        | Quantidade de pontos de vida que a parte possui no momento                                                   |     int      | 4       | NOT NULL 

## Tabela : **Olho**

|                 |                                              |     |     |     |
| --------------- | -------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados da parte do corpo "Olho"           |     |     |     |
| **Observações** | Contém Chave Estrangeira referenciando a tabela Personagem. |     |     |     |

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte | Identificador da parte do olho do personagem                                                             |     int      | 4       | PK                    |
| Personagem        | Chave estrangeira referenciando a tabela Personagem | int          | 4       | FK      |
| tipoParte         | Identificador do tipo da parte.                                                    | int         | 4       | UNIQUE                  |
| hpMaximo       | Quantidade máxima de pontos de vida que a parte possui                                                    |      int     | 4       | NOT NULL                    |
| hpAtual        | Quantidade de pontos de vida que a parte possui no momento                                                   |     int      | 4       | NOT NULL 

## Tabela : **Braço**

|                 |                                              |     |     |     |
| --------------- | -------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados da parte do corpo "Braço"           |     |     |     |
| **Observações** | Contém Chave Estrangeira referenciando a tabela Personagem. |     |     |     |

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte | Identificador da parte do braço do personagem                                                             |     int      | 4       | PK                    |
| Personagem        | Chave estrangeira referenciando a tabela Personagem | int          | 4       | FK      |
| tipoParte         | Identificador do tipo da parte.                                                    | int         | 4       | UNIQUE                  |
| hpMaximo       | Quantidade máxima de pontos de vida que a parte possui                                                    |      int     | 4       | NOT NULL                    |
| hpAtual        | Quantidade de pontos de vida que a parte possui no momento                                                   |     int      | 4       | NOT NULL 

## Tabela : **Torço**

|                 |                                              |     |     |     |
| --------------- | -------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados da parte do corpo "Torço"           |     |     |     |
| **Observações** | Contém Chave Estrangeira referenciando a tabela Personagem. |     |     |     |

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte | Identificador da parte do torço do personagem                                                             |     int      | 4       | PK                    |
| Personagem        | Chave estrangeira referenciando a tabela Personagem | int          | 4       | FK      |
| tipoParte         | Identificador do tipo da parte.                                                    | int         | 4       | UNIQUE                  |
| hpMaximo       | Quantidade máxima de pontos de vida que a parte possui                                                    |      int     | 4       | NOT NULL                    |
| hpAtual        | Quantidade de pontos de vida que a parte possui no momento                                                   |     int      | 4       | NOT NULL 

## Tabela : **Perna**

|                 |                                              |     |     |     |
| --------------- | -------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazena os dados da parte do corpo "Perna"           |     |     |     |
| **Observações** | Contém Chave Estrangeira referenciando a tabela Personagem. |     |     |     |

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte | Identificador da parte da perna do personagem                                                             |     int      | 4       | PK                    |
| Personagem        | Chave estrangeira referenciando a tabela Personagem | int          | 4       | FK      |
| tipoParte         | Identificador do tipo da parte.                                                    | int         | 4       | UNIQUE                  |
| hpMaximo       | Quantidade máxima de pontos de vida que a parte possui                                                    |      int     | 4       | NOT NULL                    |
| hpAtual        | Quantidade de pontos de vida que a parte possui no momento                                                   |     int      | 4       | NOT NULL 
