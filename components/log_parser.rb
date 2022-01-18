class LogParser
  def initialize(file_path) 
    @file_path = file_path
  end

  def open_file
    if File.exists?(@file_path)
      file = File.open(@file_path)
      file_data = file.readlines.map(&:chomp)
      file.close
      file_data
    else
      raise "Arquivo não encontrado em: #{@file_path}"
    end
  end

end
