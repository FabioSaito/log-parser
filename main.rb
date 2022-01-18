require_relative "./components/log_parser"

file_path = "src/games.log"

file = LogParser.new(file_path)
puts file.open_file[0]
