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
    load_data if @file_str == ""
    @file_str[0]
  end
end
