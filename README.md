San Pedro Valley Jobs - Beta
-

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Este é o repositório do novo Job Board de [San Pedro Valley](http://jobs.sanpedrovalley.org)

Veja funcionando em [sanpedrovalleyjobs.herokuapp.com](https://sanpedrovalleyjobs.herokuapp.com)


[![Build Status](https://semaphoreci.com/api/v1/hugodias/san-pedro-valley-jobs/branches/master/badge.svg)](https://semaphoreci.com/hugodias/san-pedro-valley-jobs) [![Join the chat at https://gitter.im/hugodias/san-pedro-valley-jobs](https://badges.gitter.im/hugodias/san-pedro-valley-jobs.svg)](https://gitter.im/hugodias/san-pedro-valley-jobs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Requerimentos

- Ruby 2.3.0
- Rails 4.2.5.2
- Elasticsearch (Searchkick)
- Sidekiq (Opcional)
- Mailgun (Free no heroku)


## Como funciona

Qualquer pessoa pode cadastrar um **job** no aplicativo, porém apenas adminstradores podem aprovar ou reprovar um job.

Ao cadastrar um **job**, o adminstrador recebe um e-mail com dois links: Aprovar ou Reprovar, e os dados do job no corpo do e-mail.

O adminstrador poderá também aprovar, reprovar e remover jobs no dashboard dentro da plataforma, protegida por login. Utilizamos o `devise` para authenticação.

O autor da vaga poderá remove-la a qualquer momento informando o e-mail de cadastro do job. Ao solicitar a remoção da vaga o mesmo receberá um e-mail com o link para remover o **job** do site.

A busca de jobs é realizada utilizando o `elasticsearch` e os e-mail são enviados em background pelo `sidekiq`.

Um usuário adminstrador é criado ao rodar o seed com `rake db:seed`- Não se esqueça de fazer o passo 4 do guia abaixo para funcionar.


## Discussões [![Join the chat at https://gitter.im/hugodias/san-pedro-valley-jobs](https://badges.gitter.im/hugodias/san-pedro-valley-jobs.svg)](https://gitter.im/hugodias/san-pedro-valley-jobs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Para discussões relacionadas ao projeto, é utilizado o [gitter](https://gitter.im/hugodias/san-pedro-valley-jobs) que disponibiliza um chat em tempo real.

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

4. Duplique o arquivo `.env.example` na raiz do projeto:

    ````
    cp .env.example .env
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

Addons necessários no heroku:
* Bonsai Elasticsearch (Ou algum outro de Elasticsearch)
* Postgres
* Redis To Go (Para o sidekiq)
* Mailgun/Sandgrid/Mandril

Não se esqueça de habilitar ao menos 1 worker no painel do heroku para que o sidekiq funcione corretamente.

## Contribuindo

Quer ajudar? Excelente! O primeiro passo é procurar issues [com a tag help wanted no github](https://github.com/hugodias/san-pedro-valley-jobs/labels/help%20wanted).

Não tem nada lá? Não tem problema, porque como você sabe, [Software has bugs. This is normal](https://m.signalvnoise.com/software-has-bugs-this-is-normal-f64761a262ca#.9e469ys8y). Encontrou um Bug? *A casa é sua, fique a vontade, a geladeira é ali ó*.

Se quiser enviar um pull request, por favor faça-o na branch `dev`.

* `master` contém a versão estável do projeto.
* `dev` contém as funcionalidades que estão em desenvolvimento.

Tenha certeza que sua pull-request está bem testada, de preferência com testes unitários e de integração (Veja a pasta specs/features)

## Garantia da Qualidade [![Code Climate](https://codeclimate.com/github/hugodias/san-pedro-valley-jobs/badges/gpa.svg)](https://codeclimate.com/github/hugodias/san-pedro-valley-jobs)

Para garantir a qualidade, é utilizado um guia de estilos, boas práticas e má praticas. Essa garantia é monitorada pelo [Code Climate](https://codeclimate.com) e pelo [houndci](http://houndci.com). O Code Climate checa por má práticas de programação em relação a estrutura do código enquanto que o Houndci checa má práticas na sintaxe do código, isto é, se a leitura do mesmo não é demasiada complicada.
