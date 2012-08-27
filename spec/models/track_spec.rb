require 'spec_helper'

describe Track do
  it { should have_fields(:title, :artist, :album, :year) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :artist }

  it { should validate_numericality_of(:year).greater_than(1889) }
  it { should validate_length_of(:year).as_exactly(4) }
end
