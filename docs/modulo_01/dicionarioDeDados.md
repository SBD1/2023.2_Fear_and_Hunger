# Dicionário de Dados

## O que é?

Um dicionário de dados é uma coleção organizada de metadados que descrevem os elementos e características de um banco de dados, sistemas de informação, ou conjunto de dados. Esses metadados fornecem informações sobre o significado, origem, formato, relacionamentos e restrições dos dados armazenados, oferecendo uma visão abrangente do conteúdo e estrutura dos dados.

### Versionamento

| Versão | Data       | Modificação                 | Autor                               | Revisor(es) |
| ------ | ---------- | --------------------------- | ----------------------------------- | ----------- |
| 1.0    | 16/09/2023 | Criação do Documento        | Pedro Lima                          | -           |
| 1.1    | 24/09/2023 | Criação do modelo de tabela | Pedro, Matheus, Alexandre, Gabriela | -           |

## Tabela : **Personagem**

|                 |                    |     |     |     |     |
| --------------- | ------------------ | --- | --- | --- | --- |
| **Descrição**   | Personagem jogável |     |     |     |     |
| **Observações** | -                  |     |     |     |     |

| Nome          | Varíavel     | Descrição                          | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------- | ------------ | ---------------------------------- | ------------ | ------- | --------------------- |
| id            | idPersonagem | Identificador único do personagem  | int          | 4       | PK/Not Null           |
| Nome          | nome         | Nome do personagem                 | varchar      | 255     | Not Null/Identity     |
| Ataque        | ataque       | Valor do atributo de ataque        | int          | 4       | Default               |
| Defesa        | defesa       | Valor do atributo de defesa        | int          | 4       | Default               |
| Defesa Magica | defesaMagica | Valor do atributo de defesa magica | int          | 4       | Default               |
| Agilidade     | agilidade    | Valor do atributo de agilidade     | int          | 4       | Default               |
| Alma          | alma         | Valor do atributo de alma          | int          | 4       | Default               |

## Tabela : **Legível**

|                 |                                                    |     |     |     |
| --------------- | -------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Item Legível                                       |     |     |     |
| **Observações** | pergaminhos, livros, notas que liberem habilidades |     |     |     |

| Nome      | Varíavel  | Descrição                               | Tipo de Dado | Tamanho | Restrições de domínio |
| --------- | --------- | --------------------------------------- | ------------ | ------- | --------------------- |
| id        | idLegivel | Identificador único do personagem       | int          | 4       | PK/Not Null           |
| Nome      | nome      | Nome do item                            | varchar      | 255     | Not Null/Identity     |
| Descrição | descricao | Informação básica sobre o item legível. | varchar      | 255     | Default               |
| Conteúdo  | conteudo  | Texto ou informações contidas no item.  | varchar      | 255     | Default               |
| Efeito    | efeioto   | Impacto do item quando lido.            | varchar      | 255     | Default               |

## Tabela : **Consumível**

|                 |                                                                       |     |     |     |
| --------------- | --------------------------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Item Consumível                                                       |     |     |     |
| **Observações** | podem recuperar HP ou sanidade mental, curar infecções ou sangramento |     |     |     |

| Nome          | Varíavel     | Descrição                         | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------- | ------------ | --------------------------------- | ------------ | ------- | --------------------- |
| id            | idConsumivel | Identificador único do personagem | int          | 4       | PK/Not Null           |
| Nome          | nome         | Nome do item                      | varchar      | 255     | Not Null/Identity     |
| Conteúdo      | conteudo     | O que é contido no item           | varchar      | 255     | Default               |
| Efeito        | efeito       | Impacto do item quando consumido. | varchar      | 255     | Default               |
| Cura Sanidade | ad_mente     | Impacto do item quando consumido. | int          | 4       | Default               |
| Cura Vida     | ad_vida      | Impacto do item quando consumido. | int          | 4       | Default               |

## Tabela : **Parte**

|                 |                                                                     |     |     |     |
| --------------- | ------------------------------------------------------------------- | --- | --- | --- |
| **Descrição**   | Parte do corpo                                                      |     |     |     |
| **Observações** | Partes do corpo podem ser arrancadas por diferentes tipos de ataque |     |     |     |

| Nome        | Varíavel | Descrição                          | Tipo de Dado | Tamanho | Restrições de domínio |
| ----------- | -------- | ---------------------------------- | ------------ | ------- | --------------------- |
| id          | idParte  | Identificador único do personagem  | int          | 4       | PK/Not Null/Identity  |
| Nome        | nome     | Nome da parte do corpo             | varchar      | 255     | Not Null/Identity     |
| Tipo        | conteudo | Tipo de parte (Braço/Perna/Cabeça) | varchar      | 255     | Default               |
| Vida Máxima | hpMaximo | vida maxima da parte               | int          | 4       | Default               |
