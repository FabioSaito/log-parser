require 'json'

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
    @kills = {}
    @players = []
    @killers_log = []
    @victims_log = []
  end

  def get_first_line
    @file_str[0]
  end

  def output
    process_score
    JSON.pretty_generate(@file_path => { lines: count_file_lines, players: @players, kills: @kills, total_kills: @killers_log.count})
  end

  private
  
  def count_file_lines
    @file_str.count
  end

  def get_players
    @file_str.each do |line|
      game_event =  line.split(" ")[1]
      case game_event
      when "ClientUserinfoChanged:"
        @players.push(line.match(/n\\(.*?)\\t/).captures[0])

      when "Kill:"
        killer_player = line.match(/\d+ \d+ \d+\: (.*?) killed/).captures[0]
        victim_player = line.match(/killed (.*?) by/).captures[0]

        @killers_log.push(killer_player)
        @victims_log.push(victim_player) 
      end
    end
    @players = (@players + @killers_log + @victims_log).uniq
  end

  def get_kills
    # map killers_log to count player kills
    @killers_log.each do |killer|
      unless @kills.key?(killer)
        @kills[killer] = 1
      else
        @kills[killer] += 1
      end
    end

    # map all players to include players who don't scored
    @players.each do |player|
      @kills[player] = 0 unless @kills.key?(player)
    end
  end

  def process_score
    get_players
    get_kills
  end

end
