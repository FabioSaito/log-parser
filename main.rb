def open_file(file)
    file = File.open("src/games_short.log")
    file_data = file.readlines.map(&:chomp)
    file.close
    file_data
end
    
filePath = "src/games_short.log"
validFile = File.exists?(filePath)

if validFile
    gamesLog = open_file(filePath)
else
    puts "Arquivo não encontrado em: #{filePath}"
end

puts gamesLog[0]


