class Definition < ApplicationRecord
  belongs_to :word
  validates_presence_of :word_definition
  has_many :sub_definitions, dependent: :destroy
  accepts_nested_attributes_for :sub_definitions
end
