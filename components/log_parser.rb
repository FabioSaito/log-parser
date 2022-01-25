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

  def output
    JSON.pretty_generate(@file_path => { lines: count_file_lines, players: get_players })
  end

  private
  
  def count_file_lines
    @file_str.count
  end

  def get_players
    temp_array = []
    @file_str.each do |line|
      game_event =  line.split(" ")[1]
      case game_event
      when "ClientUserinfoChanged:"
        temp_array.push(line.match(/n\\(.*?)\\t/).captures[0])

      when "Kill:"
        temp_array.push(line.match(/\d+ \d+ \d+\: (.*?) killed/).captures[0])
        temp_array.push(line.match(/killed (.*?) by/).captures[0]) 
      end
    end
    temp_array.uniq
  end

end
