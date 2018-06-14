require 'rails_helper'

RSpec.describe Word, type: :model do

  it 'validates word_name' do
    should validate_presence_of :word_name
  end

  it 'validates word_name' do
    should validate_presence_of :word_class
  end

  it 'has many definitions' do
    should have_many(:definitions).dependent :destroy
  end

  it 'accepts nested attributes for definitions' do
    should accept_nested_attributes_for :definitions
  end

end
