class Artist < ActiveRecord::Base
  has_many :songs

  def self.artist_exist?(artist_id)
    find_by(id: artist_id).present?
  end

  def find_songs
    self.songs 
  end

end
