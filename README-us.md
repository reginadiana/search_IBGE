<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/84443430-f7ce3b00-ac15-11ea-946b-9937fe8042ab.png">
</p>

<p align="center">
  <img src="https://img.shields.io/apm/l/vim-mode?color=green&label=license&logo=license&logoColor=green&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=STATUS&message=IN%20PROGRESSS&color=ORANGE&style=for-the-badge">
</p>

:memo: [Planning Project](https://github.com/reginadiana/search_IBGE/wiki/Search-IBGE---Planejamento----Menu)

## List of Content

:small_orange_diamond: [Description of Project](#description-of-project)

:small_orange_diamond: [Installed Gems](#installed-gems)

:small_orange_diamond: [Requirements](#requirements-package)

:small_orange_diamond: [Settings](#settings)

:small_orange_diamond: [What and how to search data](#what-and-how-to-search-data-mag_right)

:small_orange_diamond: [Run tests](#run-tests-memo)

:small_orange_diamond: [Database (Table)](#database-table-bookmark_tabs)

:small_orange_diamond: [Database (Graphic)](#database-graphic-bar_chart)

:small_orange_diamond: [License](#license-trident)

## Description of Project

<p align="justify">
    The objective was to use a csv file and turn it into a database to consult it, allowing to obtain data such as: most populous municipalities in a UF, average population of each UF and search for municipalities. 
</p>

## Installed Gems

:books: [**Sqlite**](https://rubygems.org/gems/pg/versions/0.18.4?locale=pt-BR) to build a database

:books: [**RSpec**](https://github.com/rspec/rspec-rails) to write tests

## Requirements :package:

Some resources should be installed before to setting the project

:warning: [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) version >=2.6.3

:warning: [Gem](https://rubygems.org/pages/download?locale=pt-BR) version >=3.1.2

:warning: [Bundle](https://bundler.io/man/bundle-install.1.html) version >=2.1.2

To check version, run:
```
$ <name of requirement> -v
```
## Settings

In prompt command, clone this project:
```
$ git clone https://github.com/reginadiana/search_IBGE
```
Acess the folder
```
$ cd search_IBGE
```

## What and how to search data :mag_right:

**When choosing a UF, list the 10 municipalities (MU) with the largest UF population**

```ruby
```

**Search for a MU by name and list the population of that MU**

```ruby
```

**List the population of a municipality by some code**

```ruby
```
**Allow the search to be done also by name and UF code, showing the sum of the total population of the municipalities**
```ruby
```

**When choosing a UF, list the population average of the municipalities**
```ruby
```

## Run tests :memo:

```ruby
$ cd search_IBGE
$ rspec 
```

## Database (Table) :bookmark_tabs:

## Database (Graphic) :bar_chart:

## License :trident:

The [MIT License](https://github.com/reginadiana/search_IBGE/blob/master/LICENSE) (MIT)

Copyright :copyright: 2020 SEARCH IBGE
<br/>
<img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102"/>
