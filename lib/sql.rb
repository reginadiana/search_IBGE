class Sql
  def query_select
    read_file('query_SELECT.sql')
  end

  private

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end

end
