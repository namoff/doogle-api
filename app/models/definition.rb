class Definition < ApplicationRecord
  belongs_to :word
  has_many :sub_definitions, dependent: :destroy

  validates_presence_of :word_definition
end
