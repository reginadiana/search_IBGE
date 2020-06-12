class FileParser

  private
  def read_file(file)
    File.open(Dir.pwd + "/data/#{file}").read
  end
end
