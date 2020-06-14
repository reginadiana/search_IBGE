class Sql
  def query_select_uf
    read_file('query_select_uf.sql')
  end

  def query_select_counties_by_uf
    read_file('query_select_counties_by_uf.sql')
  end

  private

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end

end
