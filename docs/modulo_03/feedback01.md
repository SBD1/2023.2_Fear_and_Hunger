# Feedback

### Versionamento

| Versão | Data       | Modificação                                                                              | Autor                               |
| ------ | ---------- | ---------------------------------------------------------------------------------------- | ----------------------------------- |
| 0.1    | 13/11/2023 | Criação do documento e formalização do feedback                                          | Gabriela                            |

Como uma forma de auxiliar nas correções, formalizamos o feedback fornecido pelo professor organizando-os em tópicos:

**1.** Parte do mapa está simples: apenas utilizamos a Entidade “local” e não temos regiões. Isso pode dificultar para separar as áreas e atrapalhar no respawn de monstros, por exemplo. 

**2.** O item não tem instância. 

**3.** Item tem id do inventário no DER (problema da chave estrangeira, acredito). 

**4.**  Item tem id do lojista (problema de chave estrangeira, acredito). 

**5.** Generalização e especialização da parte: as Entidades específicas não possuem atributos. Se não possuem, apenas precisa do atributo tipoParte na Parte. As tabelas criadas (braço, genital, cabeça, etc) não existem e fica apenas Entidade “parte” com o atributo identificador. 

**6.** Lojista tem inventário pois lojista está em personagem e herda isso e por algum motivo o inimigo nao está com inventário. Por que? (Isso vem do nosso modelo relacional? verificar!) 

**7.** Alma tem id do personagem (problema de chave estrangeira, acredito).

**8.** Cardinalidade de alma com personagem jogável é estranha: precisamos de várias almas uma pra cada personagem que coletar, mas essas almas muitas vezes tem os mesmos dados, o que torna estranho. 

**9.** Inventário é estranho: só tem o id do inventário e id do personagem (acho que esse último deveria estar apenas no modelo relacional demonstrando a relação). Qual a utilidade dessa tabela? Atributos que contém número de itens do inventário seria interessante. 

**10.** Habilidades e ataques: quando o personagem coleta alma a alma pode ter várias habilidades e cada habilidade pode ou não ter um ataque. Então no nosso jogo evoluímos o personagem com ele coletando almas e isso dará novas habilidades e ataques pro personagem jogável? 

**11.** Módulo 3: na relaçao em que a Entidade “inimigo” não vira “lojista”, apenas “lojista” vira “inimigo” temos que alterar a generalização de “Total Exclusiva” para “Total Sobreposta”. 

**12.**  Aplicar o módulo 3 na parte de “lojista” vira “inimigo” e não “inimigo” vira “lojista” 

**13.** **Sugestões:** ainda dá para melhorar! Podemos adicionar coisas novas visto que parte do nosso diagrama entidade irá sumir (entidades específicas de parte). 

**14.** **Dicionário de dados:** temos apenas dois tipos de dados. Diversificar!

**15.** **Dicionário de dados:** Tipo Varchar tamanho 255: muito grande! 

**16.** **Dicionário de dados:** [PDF com correções.]()
