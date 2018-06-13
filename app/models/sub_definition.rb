class SubDefinition < ApplicationRecord
  belongs_to :definition

  validates_presence_of :word_sub_definition
end
