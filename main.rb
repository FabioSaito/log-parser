require_relative "./components/log_parser"
require_relative "./components/handling_functions"

file_path = "src/games.log"

file_obj = LogParser.new(file_path)
file_obj.load_data
file_obj.print_first_line

#print_first_line(log_file)
