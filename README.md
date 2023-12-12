# Grupo - Fear & Hunger

<div align="center">

<div align="center"><img src= "https://i.imgur.com/dTIta6r.png" height="230" width="auto"/></div>

</div>

## Alunos

| Nome                             | Matrícula | Github                                         |
| -------------------------------- | --------- | ---------------------------------------------- |
| Alexandre de Santana Beck        | 211061350 | [@zzzBECK](https://github.com/zzzBECK)         |
| Gabriela de Oliveira Lemos       | 170010872 | [@heylisten64](https://github.com/heylisten64) |
| Matheus Fonseca Sousa            | 170111059 | [@gatotabaco](https://github.com/gatotabaco)   |
| Pedro Henrique de Lima Malaquias | 170020525 | [@pedroLimass](https://github.com/pedroLimass) |

## Sobre

<div align="center"><img src= "https://i.imgur.com/BHClFC4.png" height="" width="auto"/></div>

Fear & Hunger é um jogo de role-playing sombrio que mergulha os jogadores em um universo perturbador e desafiador. Este projeto tem fins educativos e busca auxiliar na compreensão de Sistemas de Gerenciamento de Bancos de Dados. Exploraremos, dentro das limitações impostas pelo tempo da disciplina e do escopo do projeto, a vasta e sinistra narrativa desse título, destacando sua complexa mecânica de jogo, personagens e enredo envolventes que mergulham os jogadores em um mundo sombrio repleto de horrores inimagináveis. A proposta é fazer um pequeno jogo baseado em texto que se passe no mesmo universo de Fear and Hunger.

# Como Rodar o Projeto

## Pré-requisitos do Sistema

Certifique-se de que os seguintes itens estejam instalados antes de prosseguir:

- [Node.js](https://nodejs.org/en/)
- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Comandos para Execução da Aplicação

### Build e Execução da Aplicação

Para construir o projeto e iniciar a aplicação, utilize o seguinte comando:

```
make build
```

### Suspensão da Aplicação

Para interromper a execução da aplicação, utilize o comando:

```
make stop
```

### Inicialização da Aplicação (Após o Build)

Se a aplicação já estiver construída, inicie-a com o seguinte comando:

```
make start
```

### Reinicialização da Aplicação (Para Migrações)

Caso seja necessário reiniciar a aplicação para efetuar migrações, utilize o comando:

```
make restart
```


### Limpeza de Volumes e Containers Docker

Para limpar volumes e containers do Docker, execute:

```
make prune
```

### Limpeza Completa do Docker (Cuidado ao Usar)

Para limpar completamente o ambiente Docker (atenção: este comando remove todos os volumes e containers), utilize com cautela:

```
make clean
```

Certifique-se de compreender as consequências antes de executar o último comando.

## Apos fazer o build

O Projeto se encontra disponível na porta `http://localhost:5173`.

## Como acessar o PgAdmin
 Abra um navegador da web e vá para http://localhost:80. Você será direcionado para a interface do PGAdmin.

 Faça o login: Use as credenciais que você definiu nas variáveis de ambiente:
  - E-mail: `admin@example.com`
  - Senha: `adminpassword`

Adicionar um servidor PostgreSQL:

- No PGAdmin, clique em "Adicionar Novo Servidor".
- Em "General", insira um nome para o servidor: `sbd1_database`.
- Em "Conexão", configure as seguintes informações:
  - Hostname/address: `db`.
  - Port: `5432`
  - Username: `postgres`
  - Password: `postgres`
-  Depois de preencher essas informações, clique em "Salvar".

# Apresentações
[Apresentação do Módulo 1](https://youtu.be/hq5K7pO5bPs) <br>
[Apresentação do Módulo 2](https://www.youtube.com/watch?v=rAxV4Q2LYVc) <br>
[Apresentação do Módulo 3](https://www.youtube.com/watch?v=vbgUQetyP7w) <br>
[Apresentação Final](https://youtu.be/mu0X1KlzbUE) <br>

# Entregas

- Módulo 1
  - [DER](https://sbd1.github.io/2023.2_Fear_and_Hunger/#/./modulo_01/DER)
  - [Modelo Relacional](https://sbd1.github.io/2023.2_Fear_and_Hunger/#/./modulo_01/MREL)
  - [Dicionário de Dados](https://sbd1.github.io/2023.2_Fear_and_Hunger/#/./modulo_01/DICIO)
 
- Módulo 2
  - [Normalização](https://sbd1.github.io/2023.2_Fear_and_Hunger/#/./modulo_02/normalizacao)   
  - [DDL](https://sbd1.github.io/2023.2_Fear_and_Hunger/#/./modulo_02/DDL)
  - [DML](https://sbd1.github.io/2023.2_Fear_and_Hunger/#/./modulo_02/DML)
  - [DQL](https://sbd1.github.io/2023.2_Fear_and_Hunger/#/./modulo_02/DQL)
  - [Documento Completo SQL](https://github.com/SBD1/2023.2_Fear_and_Hunger/tree/main/pdf)

- Módulo 3 
