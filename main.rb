require_relative "./components/log_parser"
require_relative "./components/handling_functions"

file_path = "src/games.log"

file = LogParser.new(file_path)
log_file = file.open_file

print_first_line(log_file)
