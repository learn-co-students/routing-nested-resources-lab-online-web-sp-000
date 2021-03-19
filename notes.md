[1, 2, 3].detect { |i| i += 1; break i if i == 2 } 
# => 2

[1, 2, 3].detect { |i| i += 1; break i if i == 10 }
# => nil

 def index
    if params[:artist_id]
      #binding.pry
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist.nil?
        redirect_to artists_path, flash[:alert] = "Artist not found."
      else
        @songs = @artist.songs
      end
    else
      @songs = Song.all
    end
  end

  #= > I need to return the artist or nil