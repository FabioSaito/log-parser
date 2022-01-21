require "json"
require 'set'

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

  def get_players
    @players = Set[]
    temp_array = []
    @file_str.each do |line|
      temp_array =  line.split(" ")
      case temp_array[1]
      when "ClientUserinfoChanged:"
        @players.add(line.match(/n\\(.*?)\\t/).captures[0])

      when "Kill:"
        @players.add(line.match(/\d+ \d+ \d+\: (.*?) killed/).captures[0])
        @players.add(line.match(/killed (.*?) by/).captures[0]) 
      end
    end
    @players.to_a
  end

  def output
    JSON.pretty_generate(@file_path => { lines: count_file_lines, players: get_players })
  end

  private
  
  def count_file_lines
    @file_str.count
  end
end
