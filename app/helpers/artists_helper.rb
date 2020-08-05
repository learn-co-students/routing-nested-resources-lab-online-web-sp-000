module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end
end

#responds to display artist with one argument
#link to edit song if artist empty
#displays a link to the artist page if artist not empty 
