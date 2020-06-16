require 'io/console'
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

def welcome
  puts 'Bem-vindo a plataforma de pesquisa do IBGE!'
end

def clear
  system('clear')
  puts
end

def menu
  puts "[#{SELECT_UF}] Veja as informações de uma UF"
  puts "[#{SELECT_COUNTIES_BY_UF}] Veja todos os municipios de uma UF"

  puts "[#{POPULATION_BY_COUNTY}] Veja o total da população de um Municipio"
  puts "[#{SELECT_COUNTY}] Veja as informações de um Municipio"

  puts "[#{LARGEST_POPULATION}] Veja os 10 Municipios com maior população do Brasil"
  puts "[#{LESS_POPULATION}] Veja os 10 Municipios com menor população do Brasil"
  puts "[#{LARGEST_POPULATION_OF}] Veja os 10 Municipios com maior população de uma UF"
  puts "[#{LESS_POPULATION_OF}] Veja as informações com menor população de uma UF"

  puts "[#{SUM_POPULATION_BY_UF}] Escolha uma UF e veja a soma da população"
  puts "[#{POPULATION_AVARAGE}] Escolha uma UF e veja a média populacional"

  puts "[#{SAIR}] Sair"

  print 'Escolha uma opção: '
  gets.to_i
end

def wait_keypress
  puts
  puts 'Pressione alguma tecla para continuar'
  STDIN.getch
end

def read_input
  gets.chomp
end

def insert_uf
  print 'Digite o código da UF:'
  code = read_input
end

def insert_county
  print 'Digite o código do Municipio:'
  code = read_input
end

clear
welcome
opcao = menu

while opcao != SAIR
  if opcao == SUM_POPULATION_BY_UF
    uf = insert_uf
    uf.salvar
    wait_keypress
    clear
  end
end




