# Normalizacao

## Primeira Forma Normal

|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Atributos devem ser monovalorados. | 
| **Resolucao 1** | Cria-se uma nova relacao entre a chave da relacao original e o atributo multivalorado. Depois retira o atributo da relacao original.                  |  
| **Resolucao 2** | Promove a quebra do atributo, um atributo que recebe dois parametros eh especificado em dois atributos distintos|  

**Analise:**
**1.**  Tabela de Estoque garante a primeira forma normal da relacao entre Lojista e Item.
    
**2.**  Tabela Coletadas garante a primeira forma normal da relacao entre Personagem Jogavel e Almas.
    
**3.**  A quebra do atributo acessorio em acessorio1 e acessorio2 garante a primeira forma normal.
    
**4.**  Tabela Loot garante a primeira forma normal da relacao entre Personagem e Local.

## Segunda Forma Normal

|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Nao pode haver dependencia parcial (onde um atributo depende de parte da chave) | 
| **Resolucao 1** | A parte da chave e o atributo que depende desta formam outra relacao. Logo depois, retiramos o atributo da relacao original|  

**Analise:**

**1.** Analisando relacoes que possa existir dependencia funcional parcial, no caso de relacoes com mais de uma chave e atributos ordinarios, selecionamos estas relacoes: **Cabeca**, **Genital**, **Olho**, **Braco**, **Torco**, **Perna**. Nesses casos nao ha qualquer tipo de dependencia entre os atributos comuns e as chaves parciais devido ao contexo em que se inserem essas tabelas. Sendo assim, nao foi necessario fazer normalizacao, pois nao se aplica nesse caso.

## Terceira Forma Normal

|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Nao pode haver dependencia transitiva de atributos comuns com qualquer superchave | 
| **Resolucao 1** | Cria-se uma nova relacao na qual ha atributos dependentes transitivamente e os atributos a quais dependem diretamente respectivamente. O atributo com a dependencia transitiva sai da relacao |  

**1.**  Nao observamos nenhuma relacao de dependencia ente atributos, entao, segundo o que diz a terceira forma normal, acreditamos que nao seja necessaria nenhuma alteracao. Assim, o modelo esta na terceira forma normal.

## Forma Normal Boyce-Codd

|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Para toda dependencia funcional X -> A, X deve ser chave candidata | 
| **Resolucao 1** | Consideramos as dependencias funcionais em que o lado esquerdo nao eh chave candidata e transformamos cada uma dessas dependencias funcionais em novas relacoes. Logo, retiramos os correspondentes atributos - lado direito das DFs - da relacao original | 
| **Observacao** | A Forma Normal de Boyce-Codd quando as formas normais primeira, segunda e terceira ja estiverem sido verificadas eh bastante rara | 

**Analise:** 
**1.** Em todas as relacoes observadas os atributos ordinarios sao dados isolados que nao possuem dependencia entre eles e nao ha a presenca de dependencia parcial. Sendo assim, todas as dependencias funcionais X -> A, X sao chaves candidatas.


## Quarta Forma Normal
|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Não pode haver dependência multivalorada, pois causa redundância | 
| **Resolucao** | Em dependências multivaloradas de forma que A determina de forma multivalorada B, A -> -> B. Dividir a relação R em dois atributos, sendo A U B e R - B. Dessa forma não haverão mais dependências multivaloradas|

**1.** Assim como nos outros casos, não há relação de dependência entre atributos. Sendo assim, não houve necessidade de qualquer alteração. Sendo assim, o modelo está na quarta forma normal.
