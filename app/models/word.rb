class Word < ApplicationRecord
  serialize :definitions, Array

  validates_presence_of :word_name
end
