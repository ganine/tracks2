class Track
  include Mongoid::Document
  field :title, type: String
  field :artist, type: String
  field :album, type: String
  field :year, type: Integer
end
