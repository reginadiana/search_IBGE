# frozen_string_literal: true

class Sql

  # Info sobe a UF
  def query_select_uf
    read_file('query_select_uf.sql')
  end

  def query_select_counties_by_uf
    read_file('query_select_counties_by_uf.sql')
  end

  # Info sobre o Municipio
  def query_population_by_county 
    read_file('query_population_by_county.sql')
  end

  def query_select_county
    read_file('query_select_county.sql')
  end

  # Info sobre maior e menor população
  def query_largest_population
    read_file('query_largest_population.sql')
  end

  def query_less_population
    read_file('query_less_population.sql')
  end
  
  def query_largest_population_of
    read_file('query_largest_population_of.sql')
  end

  # Soma/Media
  def query_sum_population
    read_file('query_sum_population.sql') 
  end

  def query_population_average
    read_file('query_population_average.sql') 
  end

  private

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end

end
