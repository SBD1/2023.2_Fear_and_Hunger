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

# Apos fazer o build

O Projeto se encontra disponível na porta `http://localhost:5173`.

# Como acessar o PgAdmin
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