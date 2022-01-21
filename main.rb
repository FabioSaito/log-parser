require_relative "./components/log_parser"

file_path = "src/games.log"

file_obj = LogParser.new(file_path)

# --- Tarefa 1 ---
puts "\n[Tarefa 1 - Imprimir a primeira linha]"
puts file_obj.get_first_line

# --- Tarefa 2 ---
puts "\n[Tarefa 2 - Imprimir json conforme modelo]"
puts file_obj.output
