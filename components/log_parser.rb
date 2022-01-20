class LogParser
  def initialize(file_path)
    if File.exists?(file_path)
      @file_path = file_path
      @file_str = ""
    else
      raise "Arquivo não encontrado em: #{file_path}"
    end
  end

  def load_data
    file = File.open(@file_path)
    @file_str = file.readlines.map(&:chomp)
    file.close
  end

  def print_first_line
    puts @file_str[0]
  end

end
