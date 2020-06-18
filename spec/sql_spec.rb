# frozen_string_literal: true

require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open "db/database.db"

  context('busca por informações em Unidades Federativas e') do
    it 'realiza a query pelo código e retorna as informações de uma UF' do
      resultado = db.execute("SELECT * FROM Federatives WHERE Code=35")
      expect(resultado[0][0]).to eq 'UF'
      expect(resultado[0][1]).to eq 35
      expect(resultado[0][2]).to eq "São Paulo\n"
    end
    it 'realiza a query pelo nome e retorna as informações de uma UF' do
      resultado = db.execute("SELECT * FROM Federatives WHERE Title LIKE'%São Paulo%'")
      expect(resultado[0][0]).to eq 'UF'
      expect(resultado[0][1]).to eq 35
      expect(resultado[0][2]).to eq "São Paulo\n"
    end

    it 'realiza a query pelo código e retorna todos os municipios de uma UF' do
      resultado = db.execute("SELECT Title FROM Counties WHERE Code LIKE'35%'")
      expect(resultado.length).to eq 645
    end
  end

  context('Busca por informações dos Municipios e') do

    it 'realiza a query pelo código e busca a sua população a partir de uma MU' do
      resultado = db.execute("SELECT Population FROM Counties WHERE Code=3547809", )
      expect(resultado).to eq [[718_773]]
    end
    it 'realiza a query pelo nome e retorna as informações de um MU' do
      resultado = db.execute("SELECT * FROM Counties WHERE Title LIKE'Santo André (SP)%'")
      expect(resultado).to eq [['MU', 354_780_9, 'Santo André (SP)', 718_773]]
    end

    it 'Realiza a query em Municipios e retorna as informações de um municipio pelo código' do 
      resultado = db.execute('SELECT * FROM Counties WHERE Code=3547809')
      expect(resultado).to eq [['MU', 354_780_9, 'Santo André (SP)', 718_773]]
    end
  end

  context('Busca por municipios e') do
    it 'realiza a query para buscar os 10 municipios com maior população do Brasil' do
      resultado = db.execute(Sql.new.query_largest_population)
      expect(resultado).to eq [['São Paulo (SP)'], ['Rio de Janeiro (RJ)'], ['Brasília (DF)'], ['Salvador (BA)'], ['Fortaleza (CE)'], 
      ['Belo Horizonte (MG)'], ['Manaus (AM)'], ['Curitiba (PR)'], ['Recife (PE)'], ['Goiânia (GO)']]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população do Brasil' do
      resultado = db.execute(Sql.new.query_less_population)
      expect(resultado).to eq [['Serra da Saudade (MG)'], ['Borá (SP)'], ['Araguainha (MT)'], ['Engenho Velho (RS)'], ['Oliveira de Fátima (TO)'], 
      ['Anhanguera (GO)'], ['União da Serra (RS)'], ['Cedro do Abaeté (MG)'], ['Uru (SP)'], ['Miguel Leão (PI)']]
    end

    it 'Realiza a query para buscar os 10 municipios com maior população de uma UF pelo código' do
      resultado = db.execute("SELECT Title FROM 
      (SELECT * FROM Counties WHERE Code LIKE'35%') 
      ORDER BY Population DESC LIMIT 10;")

      expect(resultado).to eq [['São Paulo (SP)'], ['Guarulhos (SP)'], ['Campinas (SP)'],['São Bernardo do Campo (SP)'], ['São José dos Campos (SP)'],
      ['Santo André (SP)'], ['Ribeirão Preto (SP)'], ['Osasco (SP)'], ['Sorocaba (SP)'], ['Mauá (SP)']]
    end

    it 'Realiza a query para buscar os 10 municipios com maior população de uma UF pelo nome' do
      resultado = db.execute("SELECT Title FROM (SELECT * FROM Counties WHERE Title LIKE'%(SP)%') ORDER BY Population DESC LIMIT 10;")

      expect(resultado).to eq [['São Paulo (SP)'], ['Guarulhos (SP)'], ['Campinas (SP)'],['São Bernardo do Campo (SP)'], 
      ['São José dos Campos (SP)'], ['Santo André (SP)'], ['Ribeirão Preto (SP)'], ['Osasco (SP)'],['Sorocaba (SP)'], ['Mauá (SP)']]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população de uma UF pelo código' do
      resultado = db.execute("SELECT Title FROM (SELECT * FROM Counties WHERE Code LIKE'35%') ORDER BY Population LIMIT 10;")

      expect(resultado).to eq [['Borá (SP)'], ['Uru (SP)'], ['Nova Castilho (SP)'], ['Flora Rica (SP)'], ['Santana da Ponte Pensa (SP)'], 
      ['Santa Salete (SP)'], ['Fernão (SP)'],['Trabiju (SP)'], ['Turmalina (SP)'], ['Arco-Íris (SP)']]
    end

    it 'Realiza a query para buscar os 10 municipios com menor população de uma UF pelo nome' do
      resultado = db.execute("SELECT Title FROM (SELECT * FROM Counties WHERE Title LIKE'%(SP)%') ORDER BY Population LIMIT 10;")

      expect(resultado).to eq [['Borá (SP)'], ['Uru (SP)'], ['Nova Castilho (SP)'], 
                               ['Flora Rica (SP)'], ['Santana da Ponte Pensa (SP)'], 
                               ['Santa Salete (SP)'], ['Fernão (SP)'], ['Trabiju (SP)'], 
                               ['Turmalina (SP)'], ['Arco-Íris (SP)']]
    end
  end

  context('Buscas com relações matemáticas envolvidas') do
    xit 'realiza a query em Unidades Federativas pelo nome e retona a soma da população' do
      resultado = db.execute(Sql.new.query_sum_population, 'São Paulo')
      expect(resultado).to eq [[459_190_49]]
    end

    it 'realiza a query em Unidades Federativas pelo código e retona a soma da população' do
      response = db.execute("SELECT Population FROM (SELECT * FROM Counties WHERE Code LIKE'35%') ")

      sum_population = 0
      response.each do |data|
        sum_population += data[0]
      end

      expect(sum_population).to eq 459_190_49
    end

    it 'realiza a query em Unidades Federativas pelo nome e mostra a média populacional de seus municipios' do
      response = db.execute("SELECT Population FROM (SELECT * FROM Counties WHERE Code LIKE'35%') ")

      sum_population = 0
      response.each do |data|
        sum_population += data[0]
      end
      avarege = sum_population / response.length

      expect(avarege).to eq 711_92
    end
  end
end
