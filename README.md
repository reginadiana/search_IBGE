<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/84443430-f7ce3b00-ac15-11ea-946b-9937fe8042ab.png">
</p>

<p align="center">
  <img src="https://img.shields.io/apm/l/vim-mode?color=green&label=license&logo=license&logoColor=green&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=STATUS&message=IN%20PROGRESSS&color=ORANGE&style=for-the-badge">
</p>

| [:us: &nbsp; README em Ingles](https://github.com/reginadiana/search_IBGE/blob/master/README-us.md) | [Proposta](https://github.com/reginadiana/search_IBGE/blob/master/desafio_-_treinadev.pdf) |
| :------: | :------: | 

:memo: &nbsp;&nbsp; Planejamento e Fases do Projeto

| [Amostra dos Dados (CSV)](https://github.com/reginadiana/search_IBGE/wiki/Amostra-dos-Dados-CSV) | [Análise dos Dados](https://github.com/reginadiana/search_IBGE/wiki/An%C3%A1lise-dos-Dados) | [Amostra Gráfica dos Dados](https://github.com/reginadiana/search_IBGE/wiki/Amostra-Gr%C3%A1fica-dos-Dados) |
| :-----: | :-----: | :-----: | 
| [**Comandos SQL para busca**](https://github.com/reginadiana/search_IBGE/wiki/Comandos-SQL-para-busca) | [**Fases de Execução**](https://github.com/reginadiana/search_IBGE/wiki/Fases-de-Execu%C3%A7%C3%A3o) |

## Tópicos

:small_orange_diamond: &nbsp; [Descrição do Projeto](#descrição-do-projeto)

:small_orange_diamond: &nbsp; [Gems instaladas](#gems-instaladas)

:small_orange_diamond: &nbsp; [Pré-Requisitos](#pré-requisitos-package) 

:small_orange_diamond: &nbsp; [Configurações](#configurações)

:small_orange_diamond: &nbsp; [Como pesquisar pelos dados](#como-pesquisar-pelos-dados-mag_right)

:small_orange_diamond: &nbsp; [Executando os testes](#executando-os-testes-memo) 

:small_orange_diamond: &nbsp; [Licença](#licença-trident)

## Descrição do Projeto

<p align="justify">
    O objetivo foi usar um arquivo .csv e converte-lo em uma base de dados para consulta, permitindo obter dados como: maior população de cada UF, pesquisa por UF, etc. 
</p>

## Gems instaladas

:books: &nbsp; [**Sqlite**](https://rubygems.org/gems/pg/versions/0.18.4?locale=pt-BR) para construir o banco de dados 

:books: &nbsp; [**RSpec**](https://github.com/rspec/rspec-rails) para escrever e executar testes unitários, isto é, de baixo nível 

## Pré-Requisitos :package:

Algumas dependencias devem ser instaladas antes de configurar o projeto:

:warning: &nbsp; [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=2.6.3

:warning: &nbsp; [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

:warning: &nbsp; [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

Para checar a versão, execute:
```
$ <nome da dependencia> -v
```
## Configurações

No terminal, clone este projeto:
```
$ git clone https://github.com/reginadiana/search_IBGE
```
Acesse a pasta:
```
$ cd search_IBGE
```
Instale as dependencias e prepare o banco de dados:
```
$ bin/setup
```
Para abrir o menu:
```
$ ruby lib/search.rb
```

## Como pesquisar pelos dados :mag_right:

<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/85049538-2b0b4f80-b16b-11ea-9597-f234f8461642.jpg" width="600"/>
</p>

**1. Digite uma das opções do menu**

**2. Digite o código da UF ou do Municipio**

Obs: caso uma opção invalida seja escolhida ou se a busca não for executada com sucesso uma mensagem de erro será mostrada.

## Executando os testes :memo:

```ruby
$ cd search_IBGE
$ rspec 
```

## Licença :trident:

The [MIT License](https://github.com/reginadiana/search_IBGE/blob/master/LICENSE) (MIT)

Copyright :copyright: 2020 SEARCH IBGE
<br/>
<img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102"/>
