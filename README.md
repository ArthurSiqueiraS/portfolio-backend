# Instalação Cientum 2.0

### Clonar repositório

```bash
git clone git@gitlab.com:indeorum/cientum.git
cd cientum
git checkout cientum-2.0
```

### Instalar dependências

Caso não possua as dependências de desenvolvimento (NodeJS, MongoDB e Ruby on Rails), seguir os passos em https://github.com/ArthurSiqueiraS/WSL-Ubuntu

### Restaurar dump do S3

Baixar o dump mais recente no bucket do Amazon S3 https://s3.console.aws.amazon.com/s3/buckets/indeorum-default/dumps/mongo/?region=us-west-2&tab=overview (requisitar credenciais de acesso caso não possua)

```bash
mongorestore [pasta_do_dump] --db=umbrella --drop
```

### Instalar gemas da API

#### umbrella-api

```bash
cd lib
git clone git@gitlab.com:IndeorumProjects/umbrella-api.git
cd umbrella-api
git checkout lattes_fields
gem install rspec
gem build umbrella_api.gemspec
gem install --dev umbrella_api-0.5.0.gem
```

#### cientum-api

```bash
cd ..
git clone git@gitlab.com:IndeorumProjects/cientum-api.git
cd cientum-api
git checkout optimization
gem build cientum_api.gemspec
gem install --dev cientum_api-0.0.2.gem
```

### Bundle

```bash
cd ../..
bundle install
```

### Preparar para testes com aplicação cliente

Alterar a URL de origem das requsições ao servidor:

```ruby
# cientum/config/environments/development.rb
FRONT_END = [url_do_front]
```

### Iniciar o servidor

```bash
rails s
```