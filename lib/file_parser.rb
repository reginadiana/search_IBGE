require "sql"

class FileParser

  def files_not_exist(first_file, second_file)
    first_file_exist = File.exist?(Dir.pwd + "/data/#{first_file}.csv")
    second_file_exist = File.exist?(Dir.pwd + "/data/#{second_file}.csv")

    return (not first_file_exist and not second_file_exist) ? false : true
  end 

  def separate_csv
    if(files_not_exist("federative", "counties"))

      federative_csv = create_file("federative")
      counties_csv = create_file("counties")

      population = read_each_line("populacao_2019")
      population.each do |line|
        columns = line.split(',')
        columns.each do |item|
	  if(item==="UF")
		federative_csv.puts line[0,line.length-3]
          end
	  if(item==="MU")
		counties_csv.puts line
          end
        end
      end
      counties_csv.close
      federative_csv.close
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
end
