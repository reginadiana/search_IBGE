require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open "db/database.db"

  xcontext("busca por informações em Unidades Federativas e") do
    it 'realiza a query pelo nome e retorna as informações de uma UF' do
      resultado = db.execute(Sql.new.query_select_uf, "São Paulo")
      resultado.commit()
      expect(resultado).to eq [["UF"], [35], ["São Paulo (SP)"]]
    end

    it 'Realiza a query em Unidades Federativas pelo código e retorna as informações de uma UF' do
      resultado = db.execute(Sql.new.query_select_uf(35))
      expect(resultado).to eq [["UF"], [35], ["São Paulo (SP)"]]
    end

    it 'Realiza a query em Unidades Federativas pelo nome e retorna os nomes de seus municipios' do
      resultado = db.execute(Sql.new.query_select_counties_by_uf("São Paulo"))
      expect(resultado).to include([["Ocauçu (SP)"], ["Óleo (SP)"], ["Olímpia (SP)"], ["Onda Verde (SP)"], ["Oriente (SP)"]])
    end
    it 'Realiza a query em Unidades Federativas pelo código e retorna seus municipios' do
      resultado = db.execute(Sql.new.query_select_counties_by_uf("São Paulo"))
      expect(resultado).to eq ([["Parisi (SP)"], ["Patrocínio Paulista (SP)"], ["Paulicéia (SP)"], 
				["Paulínia (SP)"], ["Paulistânia (SP)"]])
    end
  end

  xcontext("Busca por informações dos Municipios") do

    it 'Realiza a query em Municipios pelo nome busca a sua população' do
      resultado = db.execute(Sql.new.query_population_by_county("Santo André (SP)")) 
      expect(resultado).to eq 718773
    end

    it 'Realiza a query em Municipios pelo código e busca a sua população' do
      resultado = db.execute(Sql.new.query_population_by_county(3547809))
      expect(resultado).to eq "Santo André"
    end
    it 'Realiza a query em Municipios e retorna as informações de um municipio pelo nome' do
      resultado = db.execute(Sql.new.query_select_mu("Santo André (SP)"))
      expect(resultado).to eq [[], [], [], []]
    end

    it 'Realiza a query em Municipios e retorna as informações de um municipio pelo código' do
      resultado = db.execute(Sql.new.query_select_mu("Santo André (SP)"))
      expect(resultado).to eq
    end
  end

  xcontext("Busca por municipios com maior/menor população") do
    it 'Realiza a query para buscar os 10 municipios com maior população do Brasil' do
      resultado = db.execute(Sql.new.query_largest_population("São Paulo"))
      expect(resultado).to eq [["São Paulo (SP)"], ["Rio de Janeiro (RJ)"], ["Brasília (DF)"], 
				["Salvador (BA)"], ["Fortaleza (CE)"], ["Belo Horizonte (MG)"], 
				["Manaus (AM)"], ["Curitiba (PR)"], ["Recife (PE)"], ["Goiânia (GO)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população do Brasil' do
      resultado = db.execute(Sql.new.query_less_population("São Paulo"))
      expect(resultado).to eq [["Serra da Saudade (MG)"], ["Borá (SP)"], ["Araguainha (MT)"], 
				["Engenho Velho (RS)"], ["Oliveira de Fátima (TO)"], ["Anhanguera (GO)"],
				["União da Serra (RS)"], ["Cedro do Abaeté (MG)"], ["Uru (SP)"], ["Miguel Leão (PI)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com maior população de uma UF pelo nome' do
      resultado = db.execute(Sql.new.query_largest_population_of("São Paulo"))
      expect(resultado).to eq [["São Paulo (SP)"], ["Guarulhos (SP)"], ["Campinas (SP)"], 
				["São Bernardo do Campo (SP)"], ["São José dos Campos (SP)"], 
				["Santo André (SP)"], ["Ribeirão Preto (SP)"], ["Osasco (SP)"], 
				["Sorocaba (SP)"], ["Mauá (SP)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com maior população de uma UF pelo código' do
      resultado = db.execute(Sql.new.query_largest_population_of(35))
      expect(resultado).to eq [["São Paulo (SP)"], ["Guarulhos (SP)"], ["Campinas (SP)"], 
				["São Bernardo do Campo (SP)"], ["São José dos Campos (SP)"], 
				["Santo André (SP)"], ["Ribeirão Preto (SP)"], ["Osasco (SP)"], 
				["Sorocaba (SP)"], ["Mauá (SP)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população de uma UF pelo nome' do
      resultado = db.execute(Sql.new.query_less_population_of("São Paulo"))
      expect(resultado).to eq [["Borá (SP)"], ["Uru (SP)"], ["Nova Castilho (SP)"], ["Flora Rica (SP)"], 
				["Santana da Ponte Pensa (SP)"], ["Santa Salete (SP)"], ["Fernão (SP)"], 
				["Trabiju (SP)"], ["Turmalina (SP)"], ["Arco-Íris (SP)"]]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população de uma UF pelo código' do
      resultado = db.execute(Sql.new.query_less_population_of(35))
      expect(resultado).to eq [["Borá (SP)"], ["Uru (SP)"], ["Nova Castilho (SP)"], ["Flora Rica (SP)"], 
				["Santana da Ponte Pensa (SP)"], ["Santa Salete (SP)"], ["Fernão (SP)"], 
				["Trabiju (SP)"], ["Turmalina (SP)"], ["Arco-Íris (SP)"]]
    end
  end

  context("Buscas com relações matemáticas envolvidas") do
    xit 'Realiza a query em Unidades Federativas pelo nome e retona a soma da população' do
      resultado = db.execute(Sql.new.query_sun_population("São Paulo"))
      expect(resultado).to eq 
    end

    it 'Realiza a query em Unidades Federativas pelo código e retona a soma da população' do
      resultado = db.execute(Sql.new.query_sun_population)
      resultado.bind_params(35)
      expect(resultado).to eq 
    end

    xit 'Realiza a query em Unidades Federativas pelo nome e listar a media populacional de cada municipio' do
      resultado = db.execute(Sql.new.query_population_average)
      expect(resultado).to eq 
    end
  end
end
