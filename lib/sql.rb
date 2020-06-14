class Sql
  def query_create_table
    read_file('query_create_table.sql')
  end

  private

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end

end
