require 'rails_helper'

RSpec.describe Definition, type: :model do

  it 'validates word_definition' do
    should validate_presence_of :word_definition
  end

  it 'has many sub_definitions' do
    should have_many(:sub_definitions).dependent :destroy
  end

  it 'accepts nested attributes for sub_definitions' do
    should accept_nested_attributes_for :sub_definitions
  end

end
