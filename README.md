# Structure Microservices NodeJs

Projeto que tem a estrutura de pastas e arquivos para execução de um projeto na arquitetura microservices, usando Docker

## O que é esse projeto?
Esse projeto é sobre estrutura de pastas e arquivos de um e-commerce usando arquiterua desacoplada(microservices). São reunidos nesse pequeno exemplo, cerca de 4 serviços, onde serão descritos mais adiante.

## Quem pode usar?
Qualquer pessoa que tenha interesse em iniciar algum projeto focado em microservices, poderá usar esse repositório como um guia base, para saber como funciona a estrutra de pastas e arquivos usando NodeJs

## Como executar?
Para rodar a versão dev do docker-compose, basta rodar o comando: `docker-compose -f docker-compose.yaml up --build`

## Está pronto para rodar na nuvem?
Para o funcionamento perfeito de um projeto usando a arquitetura microservices, é recomendado o uso de algum orquestrador de conteiner, no qual recomendo o uso do Kubernetes, para então utilizar todos os proveitos que a nuvem e a arquitetura microservices pode entregar para o produto, para o cliente e o programador

---

## Dicas
1 - Caso você for trabalhar em algum time, recomendo fortemente que você crie um repositório específico para o serviço, pois se não, toda push que você fizer de seu serviço, o restante da sua equipe, terá que fazer um pull. Logo, recomendo que cada serviço tenha um próprio repo, para que cada time, possa mexer livremente sem se importar com o versionamento de código de outras equipes.

<br/>

2 - Cada serviço, pode ser representado como sendo uma grande ação. Exemplo:

- 1 - <strong>Authentication</strong>
    - A pasta "authentication" seria o serviço que representa a autenticação do usuário. Ou seja, a única "grande" ação dela, é prover a autenticação do usuário. 
    
    - Tanto o registro, login e acesso ao banco de dados referente a autenticação do usuário, estará dentro dessa pasta(serviço)

- 2 - <strong>Books</strong>
    - A pasta "books" seria o serviço que representa a loja de livros. Ou seja, a única "grande" ação dela, é prover o acesso aos livros, tanto tendo rotas como: "get", "update", "put", "delete" e etc... 
    
    - Tanto o acesso aos livros, como também, a parte de receber notificação caso um livro tenha voltado ao estoque, como o acesso ao banco de dados referente aos livros, estará dentro dessa pasta(serviço)

- 3 -<strong>Checkout</strong>
    - A pasta "checkout" seria o serviço que representa o checkout da compra do livro. Ou seja, a única "grande" ação dela, é processar o pagamento do pedido 

    - Acredito, que cada empresa tenha seu jeito de lidar com o serviço de "checkout" de compra, porém, em meu caso, gosto de utiliar ela como um processo de pagamento, como também, de requisição de histórico de compras e de ordem. Podendo a ela, acessar um banco de dados próprio, sobre pedidos, compra e etc...

- 4 -<strong>User</strong>
    - Acredito que nesse caso, possa ser algo um pouco emblemático, pois as funções do serviço "authentication" poderiam estar dentro do serviço "user", porém, eu, particulamente, prefiro ter essas duas grandes "ações" separadas em 2 serviços. Essa é uma questão que fica ao gosto do 'cliente' rsrs

    - A pasta "user" seria o serviço que representa todas as possíveis ações do usuário, como por exemplo, a troca de email, troca de senha, troca de nome, CPF, troca de endereço, foto do usuário e assim por diante.

</br>

3 - Recomendo fortemente, que cada serviço, tenha seu próprio banco de dados, para seu próprio uso, sem interferência de leitura/escrita/iops(read/write/iops) em outros banco de dados, para minimizar custos, escalabilidade e possíveis erros que possam acontecer.

---

# Como fazer a ligação de um serviço para outro?
Bom, nós podemos fazer a ligação usando chamadas APIs, usando o axios por exemplo, porém, teremos um problema. Caso um de nossos serviços for interrompido, e a gente fizer uma chamada API, o sistema que fez a chamada, sofrerá um problema em cascata, pois o nosso serviço depende de uma chamada API do serviço que está com problema. Logo, não irá fazer muito sentido você utilizar a arquitetura microservices, pois um dos grandes benefícios, é ter um isolamento de problemas, iria embora com esse problema em cascata. Mas então, como resolver? A melhor maneira, e que recomendo, é utilizar um enfileirador de mensagens/serviço de filas de mensagens, como por exemplo, o RabbitMQ, junto com o serviço AWS SQS(Simple Queue Service). Com essa ferramente, você não estará(na teoria) refém do seu outro serviço, e terá bem menos chances de causar um problema em cascata.

# Como juntas os serviços em apenas um só, para fazer a ligação de rotas?
Podemos fazer isso, programaticamente, usando o express, para fazer um proxy, ou podemos utilizar o nginx para isso.