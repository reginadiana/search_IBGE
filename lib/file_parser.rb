class FileParser

  def separate_csv
    federative_csv = check_existence_of_file("federative")
    counties_csv =  check_existence_of_file("counties")

    if(not federative_csv and not counties_csv)
      federative_csv = create_file("federative")
      counties_csv = create_file("counties")

      population = read_each_line("populacao_2019")
      population.each do |line|
        columns = line.split(',')
        columns.each do |item|
	  if(item==="UF")
		federative_csv.puts line
          end
	  if(item==="MU")
		counties_csv.puts line
          end
        end
      end
      counties_csv.close
    end
  end

  def convert_csv_to_db
	
  end

  private
  def read_file(file)
    File.open(Dir.pwd + "/data/#{file}.csv").read
  end
  def read_each_line(file)
    File.readlines(Dir.pwd + "/data/#{file}.csv")
  end
  def create_file(file)
    File.new("data/#{file}.csv", "w")
  end
  def check_existence_of_file(file)
    File.exist?("/data/#{file}.csv")
  end
end
