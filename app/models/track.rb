class Track
  include Mongoid::Document

  field :title, type: String
  field :artist, type: String
  field :album, type: String
  field :year, type: Integer

  validates_presence_of :title, :artist

  validates_numericality_of :year, :greater_than => 1889
  validates_length_of :year, :is => 4
end
