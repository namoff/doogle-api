class Word < ApplicationRecord
  validates_presence_of :word_name
  validates_presence_of :word_class
  has_many :definitions, dependent: :destroy
  accepts_nested_attributes_for :definitions
end
