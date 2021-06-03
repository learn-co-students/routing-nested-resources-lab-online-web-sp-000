class Song < ActiveRecord::Base
  belongs_to :artist

  def self.song_exist?(song_id)
    find_by(id: song_id).present?
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name) if !name.blank?
    self.artist = artist
  end
end
