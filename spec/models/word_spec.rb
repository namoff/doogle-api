require 'rails_helper'

RSpec.describe Word, type: :model do

  it 'validates word_name' do
    should validate_presence_of :word_name
  end

end
