require 'spec_helper'

describe FileParser do
  it 'open csv file' do
    FileParser.new.separate_csv
  end
end
