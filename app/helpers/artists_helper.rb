module ArtistsHelper
  # def display_artist(song)
  #   song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  # end

  def display_artist(song)
    if song.artist
        link_to song.artist_name, artist_path(song.artist)
    else
        link_to 'Add Artist', edit_song_path(song)
    end
end
end
