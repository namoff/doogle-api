require 'rails_helper'

RSpec.describe Definition, type: :model do

  it 'has many sub_definitions' do
    should have_many(:sub_definitions).dependent(:destroy)
  end

  it 'validates word_definition' do
    should validate_presence_of(:word_definition)
  end

end
