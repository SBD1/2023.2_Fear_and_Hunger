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

| Nome          | Descrição                          | Tipo de Dado | Tamanho | Restrições de domínio     |
| ------------- | ---------------------------------- | ------------ | ------- | ------------------------- |
| id            | Identificador único do personagem  | int          | 4       | PK/Identity/Not Null      |
| id            | Identificador único do personagem  | int          | 4       | PK/Identity/Not Null      |
| Nome          | Nome do personagem                 | varchar      | 255     | Not Null                  |
| Ataque        | Valor do atributo de ataque        | int          | 4       | Identificação do jogador. |
| Defesa        | Valor do atributo de defesa        | int          | 4       | Identificação do jogador. |
| Defesa Magica | Valor do atributo de defesa magica | int          | 4       | Identificação do jogador. |
| Agilidade     | Valor do atributo de agilidade     | int          | 4       | Identificação do jogador. |
| Alma          | Valor do atributo de alma          | int          | 4       | Identificação do jogador. |
  