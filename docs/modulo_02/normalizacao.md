# Normalizacao

## Primeira Forma Normal

|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Atributos devem ser monovalorados | 
| **Resolução 1** | Cria-se uma nova relação entre a chave da relação original e o atributo multivalorado. Depois retira o atributo da relação original.                  |  
| **Resolução 2** | Promove a quebra do atributo, um atributo que recebe dois parâmetros é especificado em dois atributos distintos|  

**Análise:**

**1.**  Tabela de Estoque garante a primeira forma normal da relação entre Lojista e Item.
    
**2.**  Tabela Coletadas garante a primeira forma normal da relação entre Personagem Jogável e Almas.
    
**3.**  A quebra do atributo acessório em acessório1 e acessório2 garante a primeira forma normal.
    
**4.**  Tabela Loot garante a primeira forma normal da relação entre Personagem e Local.

## Segunda Forma Normal

|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Nao pode haver dependência parcial (onde um atributo depende apenas de parte da chave) | 
| **Resolução 1** | A parte da chave e o atributo que depende desta formam outra relação. Logo depois, retiramos o atributo da relação original|  

**Análise:**

**1.** Analisando relações que possam existir dependência funcional parcial, no caso de relações com mais de uma chave e atributos ordinários, selecionamos estas relações: **Cabeça**, **Genital**, **Olho**, **Braço**, **Torço**, **Perna**. Nesses casos não há qualquer tipo de dependência entre os atributos comuns e as chaves parciais devido ao contexo em que se inserem essas tabelas. Sendo assim, não foi necessário fazer normalização, pois não se aplica nesse caso.

## Terceira Forma Normal

|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Não pode haver dependência transitiva de atributos comuns com qualquer superchave | 
| **Resolução 1** | Cria-se uma nova relação na qual há atributos dependentes transitivamente e os atributos a quais dependem diretamente respectivamente. O atributo com a dependência transitiva sai da relação |  

**Análise:** 

**1.**  Não observamos nenhuma relação de dependência ente atributos, então, segundo o que diz a terceira forma normal, acreditamos que não seja necessária nenhuma alteração. Assim, o modelo está na terceira forma normal.

## Forma Normal Boyce-Codd

|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Para toda dependência funcional X -> A, X deve ser chave candidata | 
| **Resolução 1** | Consideramos as dependências funcionais em que o lado esquerdo não é chave candidata e transformamos cada uma dessas dependências funcionais em novas relações. Logo, retiramos os correspondentes atributos - lado direito das DFs - da relação original | 
| **Observação** | A Forma Normal de Boyce-Codd quando as formas normais primeira, segunda e terceira ja estiverem sido verificadas é bastante rara | 

**Análise:** 

**1.** Em todas as relações observadas, os atributos ordinários são dados isolados e portanto não possuem dependência entre eles e não há a presença de dependência parcial. Sendo assim, todas as dependências funcionais X -> A, X são chaves candidatas.


## Quarta Forma Normal
|                 |                    |  
| --------------- | ------------------ |
| **Descrição**   | Não pode haver dependência multivalorada, pois causa redundância | 
| **Resolução** | Em dependências multivaloradas de forma que A determina de forma multivalorada B, A -> -> B. Dividir a relação R em dois atributos, sendo A U B e R - B. Dessa forma não haverão mais dependências multivaloradas|

**Análise:** 

**1.** Assim como nos outros casos, não há relação de dependência entre atributos. Sendo assim, não houve necessidade de qualquer alteração. Sendo assim, o modelo está na quarta forma normal.
