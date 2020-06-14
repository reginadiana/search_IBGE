require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open "db/database.db"

  context("Busca por informações das Unidades Federativas") do
    it 'Realiza a query em Unidades Federativas e retorna as informações de uma UF pelo nome' do
      resultado = db.execute(Sql.new.query_select_uf("São Paulo"))
      expect(resultado).to eq
    end

    it 'Realiza a query em Unidades Federativas e retorna as informações de uma UF pelo código' do
      resultado = db.execute(Sql.new.query_select_uf("São Paulo"))
      expect(resultado).to eq
    end

    it 'Realiza a query em Unidades Federativas pelo nome e seus municipios' do
      resultado = db.execute(Sql.new.query_select_uf("São Paulo"))
      expect(resultado).to eq
    end
    it 'Realiza a query em Unidades Federativas pelo código e seus municipios' do
      resultado = db.execute(Sql.new.query_select_uf("São Paulo"))
      expect(resultado).to eq
    end
  end

  xcontext("Busca por informações dos Municipios") do

    it 'Realiza a query em Municipios pelo nome e busca a sua população' do
      resultado = db.execute(Sql.new.query_population_by_county("Santo André")) 
      expect(resultado).to eq 718773
    end

    it 'Realiza a query em Municipios pelo código e busca a sua população' do
      resultado = db.execute(Sql.new.query_population_by_county(3547809))
      expect(resultado).to eq "Santo André"
    end
    it 'Realiza a query em Municipios e retorna as informações de um municipio pelo nome' do
      resultado = db.execute(Sql.new.query_select_mu("Santo André"))
      expect(resultado).to eq
    end

    it 'Realiza a query em Municipios e retorna as informações de um municipio pelo código' do
      resultado = db.execute(Sql.new.query_select_mu("Santo André"))
      expect(resultado).to eq
    end
  end

  xcontext("Busca por municipios com maior/menor população") do
    it 'Realiza a query para buscar os 10 municipios com maior população do Brasil' do
      resultado = db.execute(Sql.new.query_largest_population("São Paulo"))
      expect(resultado).to eq "São Paulo"
    end

    it 'Realiza a query para buscar os 10 municipios com menor população do Brasil' do
      resultado = db.execute(Sql.new.query_less_population("São Paulo"))
      expect(resultado).to eq
    end

    it 'Realiza a query para buscar os 10 municipios com maior população de uma UF pelo nome' do
      resultado = db.execute(Sql.new.query_largest_population_of("São Paulo"))
      expect(resultado).to eq
    end

    it 'Realiza a query para buscar os 10 municipios com maior população de uma UF pelo código' do
      resultado = db.execute(Sql.new.query_largest_population_of(35))
      expect(resultado).to eq
    end
  end

  xcontext("Buscas com relações matemáticas envolvidas") do
    it 'Realiza a query em Unidades Federativas pelo nome e retona a soma da população' do
      resultado = db.execute(Sql.new.query_sun_population("São Paulo"))
      expect(resultado).to eq 
    end

    it 'Realiza a query em Unidades Federativas pelo código e retona a soma da população' do
      resultado = db.execute(Sql.new.query_sun_population(35))
      expect(resultado).to eq 
    end

    it 'Realiza a query em Unidades Federativas pelo nome e listar a media populacional de cada municipio' do
      resultado = db.execute(Sql.new.query_population_average)
      expect(resultado).to eq 
    end
  end
end
