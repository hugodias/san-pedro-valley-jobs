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


## Começando

Pré-requisitos: Instale o [Elasticsearch](https://www.elastic.co/products/elasticsearch) e o [Sidekiq](https://github.com/mperham/sidekiq). PS: Atualmente utilizamos o sidekiq apenas para enviar os e-mails.


1. Clone o repositório:

    ```sh
    $ git clone git://github.com/hugodias/san-pedro-valley-jobs.git
    ```
3. Vá para pasta do projeto:

    ```sh
    $ cd san-pedro-valley-jobs
    ```

4. Instale todas as gems:

    ```sh
    $ bundle install
    ```

4. Crie as tabelas:

    ```sh
    $ rake db:create && rake db:migrate
    ```

5. E finalmente rode:

    ```sh
    $ rails s
    ```

6. Opcional: utilize heroku local para ligar o server e iniciar o sidekiq

    ```sh
    $ heroku local
    ```

## Deploy

A aplicação já está preparada para para fazer o deploy para o heroku. Depois de criar sua aplicação será necessário definir algumas variáveis. Crie um arquivo `.env` na raiz do projeto, copie e cole o conteúdo abaixo e altere com suas informações.

````
RACK_ENV=development
PORT=3000
ELASTICSEARCH_URL=http://localhost:9200
MAILGUN_DOMAIN=xxxxxxxxx
MAILGUN_USERNAME=xxxxxxxx
MAILGUN_PASSWORD=xxxxxxxx
ADMIN_EMAIL=seu.email@gmail.com
````

## Contribuindo

Se quiser enviar um pull request, por favor faça-o na branch `dev`.

* `master` contém a versão estável disso.
* `dev` contém as funcionalidades que estão em desenvolvimento.

## O que precisa ser feito?
* Encontrar uma maneira eficiente de consultar as startups cadastradas no SPV e atualizar o BD;
* Criar a página para visualizar uma startup e seus jobs;
* Criar dashboard para adminstradores aprovarem/reprovarem as vagas;
* Criar um guia de boas práticas para o cadastro das vagas;
* Criar a página "Sobre o SPV Jobs";
* Criar feature tests;
* Mostrar jobs relacionados dentro de um determinado job (https://github.com/ankane/searchkick#similar-items);
