class Artist < ActiveRecord::Base
  has_many :songs

  def self.artist_exist?(artist_id)
    !Artist.find(artist_id).nil?
  end
end
