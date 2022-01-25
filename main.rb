require_relative "./components/log_parser"

file_path = "src/games.log"

file_obj = LogParser.new(file_path)

# [Tarefa 1 - Imprimir Primeira Linha]
puts "\n[Primeira linha do Arquivo:]"
puts file_obj.get_first_line

# [Tarefa 2 - Imprimir número de linhas]

# [Tarefa 3 - Imprimir jogadores]

# [Tarefa 4 - Imprimir lista de jogadores e kills]"
puts file_obj.output
