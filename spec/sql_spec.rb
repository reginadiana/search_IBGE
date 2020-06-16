require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open "db/database.db"

  context("busca por informações em Unidades Federativas e") do
    it 'realiza a query pelo código e retorna as informações de uma UF' do
      resultado = db.execute(Sql.new.query_select_uf, 35)
      expect(resultado).to eq [["UF", 35, "São Paulo\n"]]
    end
    xit 'realiza a query pelo nome e retorna as informações de uma UF' do
      resultado = db.execute(Sql.new.query_select_uf, 'São Paulo')
      expect(resultado).to eq [["UF", 35, "São Paulo\n"]]
    end

    xit 'realiza a query pelo código e retorna todos os municipios de uma UF' do
      resultado = db.execute(Sql.new.query_select_counties_by_uf, 35)
      expect(resultado).to include(["Parisi (SP)", "Patrocínio Paulista (SP)", "Paulicéia (SP)", 
				"Paulínia (SP)", "Paulistânia (SP)\n"])
    end
  end

  context("Busca por informações dos Municipios e") do

    it 'realiza a query pelo nome e busca a sua população a partir de uma MU' do
      resultado = db.execute(Sql.new.query_population_by_county, "Santo André (SP)")
      expect(resultado).to eq 718773
    end

    it 'realiza a query pelo código e busca a sua população a partir de uma MU' do
      resultado = db.execute(Sql.new.query_population_by_county, 3547809)
      expect(resultado).to eq [[718773]]
    end
    it 'realiza a query pelo nome e retorna as informações de um MU' do
      resultado = db.execute(Sql.new.query_select_county, "Santo André (SP)")
      expect(resultado).to eq [["MU",3547809,"Santo André (SP)",718773]]
    end

    it 'Realiza a query em Municipios e retorna as informações de um municipio pelo código' do 
      resultado = db.execute(Sql.new.query_select_county, 3547809)
      expect(resultado).to eq [["MU",3547809,"Santo André (SP)",718773]]
    end
  end

  context("Busca por municipios e") do
    it 'realiza a query para buscar os 10 municipios com maior população do Brasil' do
      resultado = db.execute(Sql.new.query_largest_population)
      expect(resultado).to eq [["São Paulo (SP)"], ["Rio de Janeiro (RJ)"], ["Brasília (DF)"], 
				["Salvador (BA)"], ["Fortaleza (CE)"], ["Belo Horizonte (MG)"], 
				["Manaus (AM)"], ["Curitiba (PR)"], ["Recife (PE)"], ["Goiânia (GO)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população do Brasil' do
      resultado = db.execute(Sql.new.query_less_population)
      expect(resultado).to eq [["Serra da Saudade (MG)"], ["Borá (SP)"], ["Araguainha (MT)"], 
				["Engenho Velho (RS)"], ["Oliveira de Fátima (TO)"], ["Anhanguera (GO)"],
				["União da Serra (RS)"], ["Cedro do Abaeté (MG)"], ["Uru (SP)"], ["Miguel Leão (PI)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com maior população de uma UF pelo código' do
      resultado = db.execute(Sql.new.query_largest_population_of, 35)
      expect(resultado).to eq [["São Paulo (SP)"], ["Guarulhos (SP)"], ["Campinas (SP)"], 
				["São Bernardo do Campo (SP)"], ["São José dos Campos (SP)"], 
				["Santo André (SP)"], ["Ribeirão Preto (SP)"], ["Osasco (SP)"], 
				["Sorocaba (SP)"], ["Mauá (SP)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com maior população de uma UF pelo nome' do
      resultado = db.execute(Sql.new.query_largest_population_of, "São Paulo")
      expect(resultado).to eq [["São Paulo (SP)"], ["Guarulhos (SP)"], ["Campinas (SP)"], 
				["São Bernardo do Campo (SP)"], ["São José dos Campos (SP)"], 
				["Santo André (SP)"], ["Ribeirão Preto (SP)"], ["Osasco (SP)"], 
				["Sorocaba (SP)"], ["Mauá (SP)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população de uma UF pelo código' do
      resultado = db.execute(Sql.new.query_less_population_of, 35)
      expect(resultado).to eq [["Borá (SP)"], ["Uru (SP)"], ["Nova Castilho (SP)"], ["Flora Rica (SP)"], 
				["Santana da Ponte Pensa (SP)"], ["Santa Salete (SP)"], ["Fernão (SP)"], 
				["Trabiju (SP)"], ["Turmalina (SP)"], ["Arco-Íris (SP)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população de uma UF pelo nome' do
      resultado = db.execute(Sql.new.query_less_population_of, "São Paulo")
      expect(resultado).to eq [["Borá (SP)"], ["Uru (SP)"], ["Nova Castilho (SP)"], ["Flora Rica (SP)"], 
				["Santana da Ponte Pensa (SP)"], ["Santa Salete (SP)"], ["Fernão (SP)"], 
				["Trabiju (SP)"], ["Turmalina (SP)"], ["Arco-Íris (SP)"]]
    end
  end

  context("Buscas com relações matemáticas envolvidas:") do
    it 'realiza a query em Unidades Federativas pelo nome e retona a soma da população' do
      resultado = db.execute(Sql.new.query_sum_population, "São Paulo")
      expect(resultado).to eq [[45919049]]
    end

    it 'realiza a query em Unidades Federativas pelo código e retona a soma da população' do
      resultado = db.execute(Sql.new.query_sum_population, 35)
      expect(resultado).to eq [[45919049]]
    end

    it 'realiza a query em Unidades Federativas pelo nome e lista a média populacional de seus municipios' do
      resultado = db.execute(Sql.new.query_population_average, "São Paulo")
      expect(resultado).to eq [[71192.324]]
    end

    it 'realiza a query em Unidades Federativas pelo código e lista a média populacional de seus municipios' do
      resultado = db.execute(Sql.new.query_population_average, 35)
      expect(resultado).to eq [[71192.324]]
    end
  end
end
