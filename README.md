San Pedro Valley Jobs - Alpha 0.1
-

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Este é o repositório do novo Job Board de [San Pedro Valley](http://jobs.sanpedrovalley.org)

Veja funcionando em [sanpedrovalleyjobs.herokuapp.com](https://sanpedrovalleyjobs.herokuapp.com)


## Requerimentos

- Ruby 2.3.0
- Rails 4.2.5.2
- Elasticsearch (Searchkick)
- Sidekiq (Opcional)
- Mailgun (Free no heroku)


## Como funciona

Qual pessoa pode cadastrar um **job** no aplicativo, porém apenas adminstradores podem aprovar ou reprovar um job.

Ao cadastrar um JOB, o adminstrador recebe um e-mail com dois links: Aprovar ou Reprovar, e os dados do job no corpo do e-mail.

O adminstrador poderá também aprovar, reprovar e remover jobs no dashboard dentro da plataforma, protegida por login. Utilizamos o `devise` para authenticação.

O autor da vaga poderá remove-la a qualquer momento informando o e-mail de cadastro do job. Ao solicitar a remoção da vaga o mesmo receberá um e-mail com o link para remover o **job** do site.

A busca de jobs é realizada utilizando o `elasticsearch` e os e-mail são enviados em background pelo `sidekiq`.

Um usuário adminstrador é criado ao rodar o seed com `rake db:seed`- Não se esqueça de fazer o passo 4 do guia abaixo para funcionar.



## Começando

Pré-requisitos: Instale o [Elasticsearch](https://www.elastic.co/products/elasticsearch) e o [Sidekiq](https://github.com/mperham/sidekiq). PS: Atualmente utilizamos o sidekiq apenas para enviar os e-mails.


1. Clone o repositório:

    ```sh
    $ git clone git://github.com/hugodias/san-pedro-valley-jobs.git
    ```
2. Vá para pasta do projeto:

    ```sh
    $ cd san-pedro-valley-jobs
    ```

3. Instale todas as gems:

    ```sh
    $ bundle install
    ```

4. Crie um arquivo `.env` na raiz do projeto com as seguintes informações:

````
RACK_ENV=development
PORT=3000
ELASTICSEARCH_URL=http://localhost:9200
ADMIN_NAME=Seu Nome
ADMIN_EMAIL=seu.email@gmail.com
ADMIN_PASSWORD=suasenha
MAILGUN_DOMAIN=xxxxxxxxx
MAILGUN_USERNAME=xxxxxxxx
MAILGUN_PASSWORD=xxxxxxxx
````

5. Crie as tabelas:

    ```sh
    $ rake db:create && rake db:migrate && rake db:seed
    ```

6. E finalmente rode:

    ```sh
    $ rails s
    ```

7. Opcional: utilize heroku local para ligar o server e iniciar o sidekiq

    ```sh
    $ heroku local
    ```

## Deploy

A aplicação já está preparada para para fazer o deploy para o heroku sem nenhuma alteração adicional.

Addons


## Contribuindo

Se quiser enviar um pull request, por favor faça-o na branch `dev`.

* `master` contém a versão estável do projeto.
* `dev` contém as funcionalidades que estão em desenvolvimento.

Tenha certeza que sua pull-request está bem testada, de preferência com testes unitários e de integração (Veja a pasta specs/features)

## O que precisa ser feito?
* Encontrar uma maneira eficiente de consultar as startups cadastradas no [SPV](http://sanpedrovalley.org) e atualizar o BD;
* Criar a página para visualizar uma startup e seus jobs;
* Criar dashboard para adminstradores aprovarem/reprovarem as vagas;
* Criar um arquivo completo com padrões de contribuição para o repositório (CONTRIBUTING.md);
* Criar um guia de boas práticas para o cadastro das vagas;
* Criar a página "Sobre o SPV Jobs";
* Criar feature tests;
* Mostrar jobs relacionados dentro de um determinado job (https://github.com/ankane/searchkick#similar-items);
