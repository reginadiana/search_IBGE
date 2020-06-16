class Sql
  # Informações sobe a UF
  def query_select_uf
    read_file('query_select_uf.sql')
  end

  def query_select_counties_by_uf
    read_file('query_select_counties_by_uf.sql')
  end

  # Informações sobre o Municipio
  def query_population_by_county 
    read_file('query_population_by_county.sql')
  end

  def query_select_county
    read_file('query_select_county.sql')
  end

  # Informações sobre maior/menor população
  def query_largest_population
    read_file('query_largest_population.sql')
  end

  def query_less_population
    read_file('query_less_population.sql')
  end
  def query_largest_population_of
    read_file('query_largest_population_of.sql')
  end

  # Relações matematicas sob a população
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
