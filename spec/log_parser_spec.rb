require_relative '../components/log_parser'

describe '#get_first_line' do
  it 'check first line' do
    file_path = "./spec/fixtures/files/games_test.log"
    first_expected_line = "  0:00 ------------------------------------------------------------"
    expect(LogParser.new(file_path).get_first_line).to eq(first_expected_line)
  end  
end  

describe '#initialize' do
  it 'raise error when invalid file' do
    file_path = "./spec/fixtures/files/games2.log"
    err_message = "Arquivo não encontrado em: #{file_path}"
    expect{LogParser.new(file_path)}.to raise_error(err_message)
  end
end  
