class Artist < ActiveRecord::Base
  has_many :songs

  def self.artist_exist?(artist_id)
    !Artist.find_by(id: artist_id).nil?
  end
end
