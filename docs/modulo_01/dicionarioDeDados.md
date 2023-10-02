# Dicionário de Dados

## O que é?

Um dicionário de dados é uma coleção organizada de metadados que descrevem os elementos e características de um banco de dados, sistemas de informação, ou conjunto de dados. Esses metadados fornecem informações sobre o significado, origem, formato, relacionamentos e restrições dos dados armazenados, oferecendo uma visão abrangente do conteúdo e estrutura dos dados.

### Versionamento

| Versão | Data       | Modificação                 | Autor                               | Revisor(es) |
| ------ | ---------- | --------------------------- | ----------------------------------- | ----------- |
| 1.0    | 16/09/2023 | Criação do Documento        | Pedro Lima                          | -           |
| 1.1    | 24/09/2023 | Criação do modelo de tabela | Pedro, Matheus, Alexandre, Gabriela | -           |
| 1.2    | 02/10/2023 | Adicionando tabelas | Matheus | Gabriela |
| 1.2.1    | 02/10/2023 | Pequenas Correções | Matheus | Gabriela |


## Tabela : **Personagem**

|                 |                    |     |     |     |
| --------------- | ------------------ | --- | --- | --- |
| **Descrição**   | Personagem jogável |     |     |     |
| **Observações** | -                  |     |     |     |

| Nome          | Descrição                                               | Tipo de Dado | Tamanho | Restrições de domínio     |
| ------------- | ------------------------------------------------------- | ------------ | ------- | ------------------------- |
| idPersonagemF | Identificador único do personagem                       | int          | 4       | PK/Identity/Not Null      |
| alma          | Chave estrangeira referenciando o código da tabela alma | int          | 4       | FK/Identity/Not Null      |
| nome          | Nome do personagem                                      | varchar      | 255     | Not Null                  |
| ataque        | Valor do atributo de ataque                             | int          | 4       | Identificação do jogador. |
| defesa        | Valor do atributo de defesa                             | int          | 4       | Identificação do jogador. |
| defesa Magica | Valor do atributo de defesa magica                      | int          | 4       | Identificação do jogador. |
| agilidade     | Valor do atributo de agilidade                          | int          | 4       | Identificação do jogador. |


## Tabela : **Ataque**

|                 |                                     |     |     |     |
| --------------- | ----------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações do Ataque |     |     |     |
| **Observações** | -                                   |     |     |     |

| Nome         | Descrição                                                      | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | -------------------------------------------------------------- | ------------ | ------- | ---------------------- |
| idAtaque     | Identificador único do Ataque                                  | int          | 4       | PK/Identity/Not Null   |
| tipoAtaque  | Tipo de Ataque                                                 | int          | 4       | Check/Not Null/Default |
| descrição    | Descrição do Ataque                                            | varchar      | 255     | Not Null               |
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
| idPerna | identificador da perna                           | int          | 4       | PK/Identity/Not Null  |
| hp      | Vida total referente ao membro da perna do personagem    | int          | 4       | Not Null/Default      |

## Tabela : **Braço**

|                 |                                    |     |     |     |
| --------------- | ---------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações da entidade Braço |     |     |     |
| **Observações** | -                                  |     |     |     |

| Nome    | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------- | -------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte | Chave estrangeira referenciando o código da tabela Parte | int          | 4       | FK/Identity/Not Null  |
| idBraco | Identificador do braco                          | int          | 4       | PK/Identity/Not Null  |
| hp      | Vida total atual referente ao braço do personagem    | int          | 4       | Not Null/Default      |

## Tabela : **Item**

|                 |                                    |     |     |     |
| --------------- | ---------------------------------- | --- | --- | --- |
| **Descrição**   | Armazenará as informações da entidade Item |     |     |     |
| **Observações** | -                                  |     |     |     |

| Nome    | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------- | -------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem | Chave estrangeira referenciando o código item | int          | 4       | PK/Identity/Not Null  |
| idInventario | Identificador do inventario que esse item está associado                          | int          | 4       | FK/Identity|
| descricao | Descrição do item  | varchar | 255       | Not Null/Default      |
| valor | Quanto vale esse item no lojista  | int          | 4       | Default      |
| tipo | Qual é o tipo desse item | varchar | 255       | Check/Not Null/Default      |

## Tabela : **Armadura**

|                 |                                      |     |     |     |
| --------------- | ------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações do item armadura |     |     |     |
| **Observações** | -                                    |     |     |     |

| Nome         | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | -------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem    | Chave estrangeira referenciando o idItem da entidade Item                         | int          | 4       | FK/Identity/Not Null  |
| defesa | Quanto de defesa esse item agrega ao personagem | int          | 4       | Not Null/Default  |
| defesaMagica | Quanto de defesa mágica esse item agrega ao personagem | int  | 4     | Not Null/Default |
| agilidade | Quanto de agilidade esse item agrega ao personagem | int  | 4     | Not Null/Default |

## Tabela : **Arma**

|                 |                                      |     |     |     |
| --------------- | ------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações do item arma |     |     |     |
| **Observações** | -                                    |     |     |     |

| Nome         | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | -------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem    | Chave estrangeira referenciando o idItem da entidade Item                         | int          | 4       | FK/Identity/Not Null  |
| ataqueFisico | Quanto de dano de ataque fisico essa arma agrega ao personagem | int  | 4  | Not Null/Default  |
| ataqueMagico | Quanto de dano de ataque magico essa arma agrega ao personagem | int  | 4  | Not Null/Default |

## Tabela : **Acessório**

|                 |                                      |     |     |     |
| --------------- | ------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações do item acessório |     |     |     |
| **Observações** | -                                    |     |     |     |

| Nome         | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | -------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem    | Chave estrangeira referenciando o idItem da entidade Item                         | int          | 4       | FK/Identity/Not Null  |
| defesa | Quanto de defesa esse item agrega ao personagem | int          | 4       | Not Null/Default  |
| defesaMagica | Quanto de defesa mágica esse item agrega ao personagem | int  | 4     | Not Null/Default |
| agilidade | Quanto de agilidade esse item agrega ao personagem | int  | 4     | Not Null/Default |
| ataqueFisico | Quanto de dano de ataque fisico esse acessório agrega ao personagem | int  | 4  | Not Null/Default |
| ataqueMagico | Quanto de dano de ataque magico esse acessório agrega ao personagem | int  | 4  | Not Null/Default |


## Tabela : **Lojista**

|                 |                                      |     |     |     |
| --------------- | ------------------------------------ | --- | --- | --- |
| **Descrição**   | Armazenará as informações da Lojista |     |     |     |
| **Observações** | -                                    |     |     |     |

| Nome         | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | -------------------------------------------------------- | ------------ | ------- | --------------------- |
| idLojista    | Chave primaria única do logista                         | int          | 4       | PK/Identity/Not Null  |
| idinventario | Chave estrangeira referenciando o código da tabela Inventário | int          | 4       | FK/Identity/Not Null  |
| nome         | Nome do lojista                         | varchar      | 255     | Not Null/Default      |

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


