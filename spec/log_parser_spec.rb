require_relative '../components/log_parser'

describe '#open_file' do
  it 'check first line' do
    file_path = "src/games.log"

    file = LogParser.new(file_path)
    first_log_line = file.open_file[0]
    first_expected_line = "  0:00 ------------------------------------------------------------"
    expect(first_log_line).to eq(first_expected_line)
  end  

  it 'raise error when file not valid' do
    file_path = "src/games2.log"
    err_message = "Arquivo não encontrado em: #{file_path}"
    file = LogParser.new(file_path)
    expect{file.open_file}.to raise_error(err_message)
  end

end  
