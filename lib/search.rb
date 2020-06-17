require 'io/console'
require 'sqlite3'
require 'colorize'
require_relative 'sql'

SELECT_UF = 1
SELECT_COUNTIES_BY_UF = 2
POPULATION_BY_COUNTY = 3
SELECT_COUNTY = 4
LARGEST_POPULATION = 5
LESS_POPULATION = 6
LARGEST_POPULATION_OF = 7
LESS_POPULATION_OF = 8
SUM_POPULATION = 9
POPULATION_AVARAGE = 10
SAIR = 0
MENU = 28

def welcome
  puts 'Bem-vindo a plataforma de pesquisa do IBGE!'.green
end

def clear
  system('clear')
  puts
end

def wait_keypress
  puts
  puts 'Pressione alguma tecla para continuar'
  STDIN.getch
end

def read_input
  gets.chomp
end

def read_data(file)
  data = File.readlines(Dir.pwd + "/data/#{file}.csv")
  print("\nCódigo | Unidade Federativa\n")
  data.each do |lines|
    data = lines.split(',')
    puts "[#{data[1]}] - #{data[2]}"
  end
end

def menu

  print "\nUnidades Federativas (UF):\n"
  read_data("federatives")

  print "\nMenu:\n".yellow

  puts "[#{SELECT_UF}] Veja as informações de uma UF".yellow
  puts "[#{SELECT_COUNTIES_BY_UF}] Veja todos os municipios de uma UF".yellow
  decorate
  puts "[#{POPULATION_BY_COUNTY}] Veja o total da população de um Municipio".yellow
  puts "[#{SELECT_COUNTY}] Veja as informações de um Municipio".yellow
  decorate
  puts "[#{LARGEST_POPULATION}] Veja os 10 Municipios com maior população do Brasil".yellow
  puts "[#{LESS_POPULATION}] Veja os 10 Municipios com menor população do Brasil".yellow
  puts "[#{LARGEST_POPULATION_OF}] Veja os 10 Municipios com maior população de uma UF".yellow
  puts "[#{LESS_POPULATION_OF}] Veja os 10 Municipios com menor população de uma UF".yellow
  decorate
  puts "[#{SUM_POPULATION}] Escolha uma UF e veja a soma da população".yellow
  puts "[#{POPULATION_AVARAGE}] Escolha uma UF e veja a média populacional".yellow
  decorate
  puts "[#{SAIR}] Sair".yellow

  print 'Escolha uma opção: '
  gets.to_i
end

def insert_uf
  print 'Digite o código, nome ou sigla entre parenteses da UF:'
  code = read_input
end

def insert_county
  print 'Digite o código ou nome do Municipio:'
  code = read_input
end

def decorate
  puts "-"*60
end

clear
welcome
opcao = menu
db = SQLite3::Database.open "db/database.db"

while opcao != SAIR
  if opcao == SELECT_UF
    puts "\nVoce escolheu: ver as informações de uma UF:\n".colorize(:light_blue)
    uf = insert_uf
    response = db.execute("SELECT * FROM Federatives WHERE Code=? OR Title LIKE'#{uf}%' ", uf)
    puts "#{response}\n".green
    puts "\nEscolha uma opção:"
    opcao = gets.to_i
  end
  if opcao == SELECT_COUNTIES_BY_UF
    puts "\nVoce escolheu: ver os municipios de uma UF:\n".colorize(:light_blue)
    uf = insert_uf
    response = db.execute("SELECT Title FROM Counties WHERE Code LIKE'#{uf}%' OR Title LIKE'%#{uf}%'")
    response.each do |data|
      puts "#{data}\n".green
    end
    puts "\nTotal de Municipios: " + response.length.to_s + "\n"

    puts "\nEscolha uma opção:"
    opcao = gets.to_i
  end
  if opcao == SELECT_COUNTY
    puts "\nVoce escolheu: ver informações de um Municipo:\n".colorize(:light_blue)
    county = insert_county
    response = db.execute("SELECT * FROM Counties WHERE Code=? OR Title LIKE'#{county}%'", county)
    puts "#{response}\n".green

    puts "\nEscolha uma opção:"
    opcao = gets.to_i
  end
  if opcao == LARGEST_POPULATION
    puts "\nVoce escolheu: 10 Municipios com maior população do Brasil:\n".colorize(:light_blue)

    response = db.execute(Sql.new.query_largest_population)
    response.each do |data|
      puts "#{data}\n".green
    end

    puts "\nEscolha uma opção:"
    opcao = gets.to_i
  end
  if opcao == LESS_POPULATION
    puts "\nVoce escolheu: 10 Municipios com menor população do Brasil:\n".colorize(:light_blue)

    response = db.execute(Sql.new.query_less_population)
    response.each do |data|
      puts "#{data}\n".green
    end

    puts "\nEscolha uma opção:"
    opcao = gets.to_i
  end

  if opcao == LARGEST_POPULATION_OF
    puts "\nVoce escolheu: 10 Municipios com maior população de uma UF:\n".colorize(:light_blue)
    uf = insert_uf
    response = db.execute("SELECT Title FROM 
      (SELECT * FROM Counties WHERE Code LIKE'#{uf}%' OR Title LIKE'%#{uf}%') 
      ORDER BY Population DESC LIMIT 10;")
    response.each do |data|
      puts "#{data}\n".green
    end
  
    puts "\nEscolha uma opção:"
    opcao = gets.to_i
  end

  if opcao == LESS_POPULATION_OF
    puts "\nVoce escolheu: 10 Municipios com menor população de uma UF:\n".colorize(:light_blue)
    uf = insert_uf
    response = db.execute("SELECT Title FROM 
      (SELECT * FROM Counties WHERE Code LIKE'#{uf}%' OR Title LIKE'%#{uf}%') 
      ORDER BY Population LIMIT 10;")
    response.each do |data|
      puts "#{data}\n".green
    end
  
    puts "\nEscolha uma opção:"
    opcao = gets.to_i
  end
  if opcao == SUM_POPULATION
    puts "\nSoma da Populaçao:\n"
    uf = insert_uf
    uf.salvar
    wait_keypress
    clear
  end

  if opcao < 0 or opcao > 11
    puts "\nERRO: escolha uma opção válida\n".colorize(:color => :white, :background => :red)
    break
  end
end

if opcao == SAIR
  puts "\nObrigada por acessar a nossa plataforma de pesquisa :)\n".green
end