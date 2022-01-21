require "json"

class LogParser
  def initialize(file_path)
    if File.exists?(file_path)
      @file_path = file_path
      @file_str = ""
      file = File.open(@file_path)
      @file_str = file.readlines.map(&:chomp)
      file.close
    else
      raise "Arquivo não encontrado em: #{file_path}"
    end
  end

  def get_first_line
    @file_str[0]
  end
  
  def count_file_lines
    @file_str.count
  end

  def output
    JSON.pretty_generate(@file_path => { lines: count_file_lines })
  end
end
