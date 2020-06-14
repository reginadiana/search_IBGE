require 'spec_helper'
require 'sqlite3'

describe FileParser do
 context('preparate csv files') do
  it 'open csv file' do
    FileParser.new.separate_csv
  end
  xit 'check if counties.csv and federative.csv exist' do
    response = FileParser.new.files_not_exist("federative", "counties")
    if(not response)
	expect(File.read('data/federative.csv')).to not_exist
        expect(File.read('data/counties.csv')).to not_exist
    else
	expect(File.read('data/federative.csv')).to exist
        expect(File.read('data/counties.csv')).to exist
    end 
  end
  it 'separate populacao_2019.csv in two other files csv' do
    FileParser.new.separate_csv

    expect(File.read('data/federative.csv')).to include(
      "UF,11,Rondônia")
    expect(File.read('data/federative.csv')).to_not include(
      "MU,1100015,Alta Floresta D'Oeste (RO),22945")

    expect(File.read('data/counties.csv')).to include(
      "MU,1100015,Alta Floresta D'Oeste (RO),22945")
    expect(File.read('data/counties.csv')).to_not include(
      "UF,11,Rondônia")
  end
 end
 context('preparate a database') do
  it("create tables") do
    Sql.new.query_create_table
  end
 end
end
