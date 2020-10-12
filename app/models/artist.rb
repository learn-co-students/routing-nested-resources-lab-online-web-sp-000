class Artist < ActiveRecord::Base
  has_many :songs
  
  def self.find_by_id(id)
    if id
      Artist.all.select{|artist| artist.id.to_i == id.to_i}[0]
    else
      false
    end
  end
end
