class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def self.find_by_id(id)
    if id
     Song.all.select{|song| song.id.to_i == id.to_i}[0]
    else
      false
    end
  end
end
