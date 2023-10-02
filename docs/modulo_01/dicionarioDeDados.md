# Dicionário de Dados

## O que é?

Um dicionário de dados é uma coleção organizada de metadados que descrevem os elementos e características de um banco de dados, sistemas de informação, ou conjunto de dados. Esses metadados fornecem informações sobre o significado, origem, formato, relacionamentos e restrições dos dados armazenados, oferecendo uma visão abrangente do conteúdo e estrutura dos dados.

### Versionamento

| Versão | Data       | Modificação                 | Autor                               | Revisor(es) |
| ------ | ---------- | --------------------------- | ----------------------------------- | ----------- |
| 1.0    | 16/09/2023 | Criação do Documento        | Pedro Lima                          | -           |
| 1.1    | 24/09/2023 | Criação do modelo de tabela | Pedro, Matheus, Alexandre, Gabriela | -           |


## Tabela : **Personagem**

|                 |                    |     |     |     |
| --------------- | ------------------ | --- | --- | --- |
| **Descrição**   | Personagem jogável |     |     |     |
| **Observações** | -                  |     |     |     |

| Nome          | Descrição                                               | Tipo de Dado | Tamanho | Restrições de domínio     |
| ------------- | ------------------------------------------------------- | ------------ | ------- | ------------------------- |
| idPersonagemF | Identificador único do personagem                       | int          | 4       | PK/Identity/Not Null      |
| alma          | Chave estrangeira referenciando o código da tabela alma | int          | 4       | FK/Identity/Not Null      |
| Nome          | Nome do personagem                                      | varchar      | 255     | Not Null                  |
| Ataque        | Valor do atributo de ataque                             | int          | 4       | Identificação do jogador. |
| Defesa        | Valor do atributo de defesa                             | int          | 4       | Identificação do jogador. |
| Defesa Magica | Valor do atributo de defesa magica                      | int          | 4       | Identificação do jogador. |
| Agilidade     | Valor do atributo de agilidade                          | int          | 4       | Identificação do jogador. |


## Tabela : **Ataque**

|                 |                                     |     |     |     |
| --------------- | ----------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações do Ataque |     |     |     |
| **Observações** | -                                   |     |     |     |

| Nome         | Descrição                                                      | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | -------------------------------------------------------------- | ------------ | ------- | ---------------------- |
| idAtaque     | Identificador único do Ataque                                  | int          | 4       | PK/Identity/Not Null   |
| Tipo Ataque  | Tipo de Ataque                                                 | int          | 4       | Check/Not Null/Default |
| Descrição    | Descrição do Ataque                                            | varchar      | 255     | Not Null               |
| idHabilidade | Chave estrangeira referenciando o código da tabela Habilidade. | varchar      | 255     | FK/Identity/Not Null   |


## Tabela : **Físico**

|                 |                                                    |     |     |     |
| --------------- | -------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações do tipo de Ataque Físico |     |     |     |
| **Observações** | -                                                  |     |     |     |

| Nome        | Descrição                                                 | Tipo de Dado | Tamanho | Restrições de domínio |
| ----------- | --------------------------------------------------------- | ------------ | ------- | --------------------- |
| idAtaque    | Chave estrangeira referenciando o código da tabela Ataque | int          | 4       | FK/Identity/Not Null  |
| dano_fisico | Dano Físico referente ao ataque                           | int          | 4       | Not Null/Default      |

## Tabela : **Perna**

|                 |                                    |     |     |     |
| --------------- | ---------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações da Perna |     |     |     |
| **Observações** | -                                  |     |     |     |

| Nome    | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------- | -------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte | Chave estrangeira referenciando o código da tabela Parte | int          | 4       | FK/Identity/Not Null  |
| idPerna | Dano Perna referente ao ataque                           | int          | 4       | PK/Identity/Not Null  |
| hp      | Vida total referente ao membro da perna do personagem    | int          | 4       | Not Null/Default      |


## Tabela : **Lojista**

|                 |                                      |     |     |     |
| --------------- | ------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações da Lojista |     |     |     |
| **Observações** | -                                    |     |     |     |

| Nome         | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | -------------------------------------------------------- | ------------ | ------- | --------------------- |
| idLojista    | Chave primaria  única do logista                         | int          | 4       | PK/Identity/Not Null  |
| idinventario | Chave estrangeira referenciando o código da tabela Itens | int          | 4       | FK/Identity/Not Null  |
| nome         | Dano Lojista referente ao ataque                         | varchar      | 255     | Not Null/Default      |

## Tabela : **Personagem Não Jogável**

|                 |                                                     |     |     |     |
| --------------- | --------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações de Personagem Não Jogável |     |     |     |
| **Observações** | -                                                   |     |     |     |

| Nome         | Descrição                                                     | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idPnj        | Chave primaria  única do PNJ                                  | int          | 4       | PK/Identity/Not Null  |
| idPersonagem | Chave estrangeira referenciando o código da tabela personagem | varchar      | 255     | FK/Identity/Not Null  |


## Tabela : **Inimigo**

|                 |                                      |     |     |     |
| --------------- | ------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações de Inimigo |     |     |     |
| **Observações** | -                                    |     |     |     |

| Nome      | Descrição                        | Tipo de Dado | Tamanho | Restrições de domínio |
| --------- | -------------------------------- | ------------ | ------- | --------------------- |
| idInimigo | Chave primaria  única do Inimigo | int          | 4       | PK/Identity/Not Null  |


