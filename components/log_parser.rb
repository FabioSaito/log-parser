require "json"
class LogParser
  def initialize(file_path)
    if File.exists?(file_path)
      @file_path = file_path
      @file_str = ""
      @file_lines = -1
      file = File.open(@file_path)
      @file_str = file.readlines.map(&:chomp)
      file.close
      count_file_lines
    else
      raise "Arquivo não encontrado em: #{file_path}"
    end
  end

  def get_first_line
    load_data if @file_str == ""
    @file_str[0]
  end

  def count_file_lines
    count_lines = 0
    @file_str.each do |line|
      count_lines += 1
    end
    @file_lines = count_lines
  end

  def print_file_json
    file_to_json = {:lines => @file_lines}.to_json
    puts "#{@file_path}: #{JSON.pretty_generate(JSON.parse(file_to_json))}"
  end

end
