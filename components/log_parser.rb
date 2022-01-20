require "json"

class LogParser
  def initialize(file_path)
    if File.exists?(file_path)
      @file_path = file_path
      @file_str = ""
      file = File.open(@file_path)
      @file_str = file.readlines.map(&:chomp)
      file.close
      @file_lines = @file_str.count
    else
      raise "Arquivo não encontrado em: #{file_path}"
    end
  end

  def get_first_line
    load_data if @file_str == ""
    @file_str[0]
  end

  def format_to_json
    file_to_json = {:lines => @file_lines}
    JSON.pretty_generate(@file_path => { lines: @file_lines })
  end
end
