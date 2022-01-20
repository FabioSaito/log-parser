require_relative "./components/log_parser"
require_relative "./components/handling_functions"

file_path = "src/games.log"

file_obj = LogParser.new(file_path)
file_obj.load_data
puts file_obj.get_first_line
