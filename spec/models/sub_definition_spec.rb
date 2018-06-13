require 'rails_helper'

RSpec.describe SubDefinition, type: :model do

  it 'validates word_sub_definition' do
    should validate_presence_of(:word_sub_definition)
  end

end
