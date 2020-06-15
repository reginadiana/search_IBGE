require 'spec_helper'
require 'sqlite3'

describe FileParser do
  it 'open csv file' do
    FileParser.new.separate_csv
  end
  it 'check if counties.csv and federative.csv not exist' do
    response = FileParser.new.files_not_exist("file", "other_file")
    expect(response).to eq false
  end
  it 'check if counties.csv and federative.csv exist' do
    response = FileParser.new.files_not_exist("federative", "counties")
    expect(response).to eq true
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
