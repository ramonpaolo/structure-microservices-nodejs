## Indice Languages Translates
- [Portuguese](#portuguese)
- [English](#english)

<div id="english" />

# English

##### Ops: this translate was made by me(Ramon Paolo Maran). Sorry for any problem in translate : )

# Structure of files and folder using architeture microservices on NodeJs

Project that have structure of files and folders to execution to a project using architeture microservices, using Docker and NodeJs

---

## Indice
- [What is this project?](#whatisthis-english)
- [Who can use?](#whocanuse-english)
- [How execute?](#howexecute-english)
- [This project already to run on cloud?](#alreadytocloud-english)
- [Tips](#tips-english)
- [How to make the connection beetwen services?](#howmaketheconnectionbeetwenservices-english)
- [How to join the services in only one, to do call route?](#howjointheservices-english)

---

<div id="whatisthis-english" />

## What is this project?
This project is about the structure of folders and files of an e-commerce using decoupled architecture (microservices). About 4 services are gathered in this small example, which will be described later.

<div id="whocanuse-english" />


## Who can use?
Anyone interested in starting a project focused on microservices, can use this repository as a base guide, to know how the structure of folders and files using NodeJs works.

<div id="howexecute-english" />

## How execute?
To run, execute the command: `docker-compose -f docker-compose.yaml up --build`

<div id="alreadytocloud-english" />

## This project already to run on cloud?
For the perfect functioning of a project using the microservices architecture, it is recommended to use a container orchestrator, in which I recommend the use of Kubernetes, to then use all the benefits that the cloud and the microservices architecture can deliver to the product, to the client and the programmer.

---

<div id="tips-english" />

## Tips
1 - If you are going to work in a team, I strongly recommend that you create a specific repository for the service, because if not, every push you make of your service, the rest of your team will have to pull. Therefore, I recommend that each service has its own repo, so that each team can move freely without worrying about the code versioning of other teams.

<br/>

2 - Each service can be represented as one big action. Example:

- 1 - <strong>Authentication</strong>
    - The "authentication" folder would be the service that represents user authentication. That is, its only "big" action is to provide user authentication.
    
    - Both the registration, login and access to the database regarding user authentication, will be inside this folder (service)

- 2 - <strong>Books</strong>
    - The "books" folder would be the service that represents the book store. In other words, her only "big" action is to provide access to books, both with routes such as: "get", "update", "put", "delete", ...
    
    - Both access to books, as well as the part of receiving notification if a book has returned to stock, as well as access to the database referring to the books, will be inside this folder (service)

- 3 - <strong>Checkout</strong>
    - The "checkout" folder would be the service that represents the book purchase checkout. That is, her only "big" action is to process the payment for the order.

    - I believe that each company has its own way of dealing with the purchase "checkout" service, however, in my case, I like to use it as a payment process, as well as a purchase and order history request. Being able to access her own database, about orders, purchases, ...

- 4 - <strong>User</strong>
    - I believe that in this case, it may be something a little emblematic, since the functions of the "authentication" service could be inside the "user" service, however, I particularly prefer to have these two large "actions" separated into 2 services. This is a question that is left to the taste of the 'client' : )

    - The "user" folder would be the service that represents all possible user actions, such as changing email, changing password, changing name, ID, changing address, user photo and so on.

</br>

3 - I strongly recommend that each service has its own database, for its own use, without interference of read/write/iops in other databases, to minimize costs, scalability and possible errors that may happen.

---

<div id="howmaketheconnectionbeetwenservices-english" />

## How to make the connection beetwen services?
Well, we can make the binding using API calls, using axios for example, but we will have a problem. If one of our services is interrupted, and we make an API call, the system that made the call will experience a cascading problem, as our service depends on an API call from the service that has a problem. Therefore, it will not make much sense for you to use the microservices architecture, because one of the great benefits is to have problem isolation, you would go away with this cascading problem. But then, how to solve? The best way, and which I recommend, is to use a message queue/message queue service, such as RabbitMQ, together with the AWS SQS service (Simple Queue Service). With this tool, you are not (in theory) held hostage by your other service, and you are far less likely to cause a cascading problem.


<div id="howjointheservices-english" />

--- 
## How to join the services in only one, to do call route?
We can do this, programmatically, using express, to make a proxy programmatically, or we can use nginx for this, which is our case. Along with the proxy, a load balancing is also being done.

---
</br>

<div id="portuguese" />

# Portuguese

## Estrutura de arquivos e pastas usando arquitetura microservices no NodeJs

Projeto que tem a estrutura de pastas e arquivos para execução de um projeto na arquitetura microservices, usando Docker

---

## Indice
- [O que é esse projeto?](#whatisthis-portuguese)
- [Quem pode usar?](#whocanuse-portuguese)
- [Como executar?](#howexecute-portuguese)
- [Está pronto para rodar na nuvem?](#alreadytocloud-portuguese)
- [Dicas](#tips-portuguese)
- [Como fazer a ligação de um serviço para outro?](#howmaketheconnectionbeetwenservices-portuguese)
- [Como juntas os serviços em apenas um só, para fazer a ligação de rotas?](#howjointheservices-portuguese)

---

<div id="whatisthis-portuguese" />

## O que é esse projeto?
Esse projeto é sobre estrutura de pastas e arquivos de um e-commerce usando arquiterua desacoplada(microservices). São reunidos nesse pequeno exemplo, cerca de 4 serviços, onde serão descritos mais adiante.

<div id="whocanuse-portuguese" />


## Quem pode usar?
Qualquer pessoa que tenha interesse em iniciar algum projeto focado em microservices, poderá usar esse repositório como um guia base, para saber como funciona a estrutra de pastas e arquivos usando NodeJs

<div id="howexecute-portuguese" />

## Como executar?
Para rodar, basta executar o comando: `docker-compose -f docker-compose.yaml up --build`

<div id="alreadytocloud-portuguese" />

## Está pronto para rodar na nuvem?
Para o funcionamento perfeito de um projeto usando a arquitetura microservices, é recomendado o uso de algum orquestrador de conteiner, no qual recomendo o uso do Kubernetes, para então utilizar todos os proveitos que a nuvem e a arquitetura microservices pode entregar para o produto, para o cliente e o programador

---

<div id="tips-portuguese" />

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

- 3 - <strong>Checkout</strong>
    - A pasta "checkout" seria o serviço que representa o checkout da compra do livro. Ou seja, a única "grande" ação dela, é processar o pagamento do pedido 

    - Acredito, que cada empresa tenha seu jeito de lidar com o serviço de "checkout" de compra, porém, em meu caso, gosto de utiliar ela como um processo de pagamento, como também, de requisição de histórico de compras e de ordem. Podendo a ela, acessar um banco de dados próprio, sobre pedidos, compra e etc...

- 4 - <strong>User</strong>
    - Acredito que nesse caso, possa ser algo um pouco emblemático, pois as funções do serviço "authentication" poderiam estar dentro do serviço "user", porém, eu, particulamente, prefiro ter essas duas grandes "ações" separadas em 2 serviços. Essa é uma questão que fica ao gosto do 'cliente' rsrs

    - A pasta "user" seria o serviço que representa todas as possíveis ações do usuário, como por exemplo, a troca de email, troca de senha, troca de nome, CPF, troca de endereço, foto do usuário e assim por diante.

</br>

3 - Recomendo fortemente, que cada serviço, tenha seu próprio banco de dados, para seu próprio uso, sem interferência de leitura/escrita/iops(read/write/iops) em outros banco de dados, para minimizar custos, escalabilidade e possíveis erros que possam acontecer.

---

<div id="howmaketheconnectionbeetwenservices-portuguese" />

## Como fazer a ligação de um serviço para outro?
Bom, nós podemos fazer a ligação usando chamadas APIs, usando o axios por exemplo, porém, teremos um problema. Caso um de nossos serviços for interrompido, e a gente fizer uma chamada API, o sistema que fez a chamada, sofrerá um problema em cascata, pois o nosso serviço depende de uma chamada API do serviço que está com problema. Logo, não irá fazer muito sentido você utilizar a arquitetura microservices, pois um dos grandes benefícios, é ter um isolamento de problemas, iria embora com esse problema em cascata. Mas então, como resolver? A melhor maneira, e que recomendo, é utilizar um enfileirador de mensagens/serviço de filas de mensagens, como por exemplo, o RabbitMQ, junto com o serviço AWS SQS(Simple Queue Service). Com essa ferramente, você não estará(na teoria) refém do seu outro serviço, e terá bem menos chances de causar um problema em cascata.


<div id="howjointheservices-portuguese" />

--- 
## Como juntas os serviços em apenas um só, para fazer a ligação de rotas?
Podemos fazer isso, programaticamente, usando o express, para fazer um proxy programaticamente, ou podemos utilizar o nginx para isso, que é o nosso caso. Junto com o proxy, também está sendo feito um load balancing(balanceador de carga).