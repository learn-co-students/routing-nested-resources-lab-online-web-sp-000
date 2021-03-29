class SongsController < ApplicationController
  def index
          if params[:artist_id]
           @artist = Artist.find_by(id: params[:artist_id])
           if @artist.nil?
             redirect_to artists_path, alert: "Artist not found"
           else
             @songs = @artist.songs
           end
         else
           @songs = Song.all
         end
  end

  def show
        if params[:artist_id]
            @artist = Artist.find_by(id: params[:artist_id])
            @song = @artist.songs.find_by(id: params[:id])
            if @song.nil?
              redirect_to artist_songs_path(@artist), alert: "Song not found"
            end
          else
            @song = Song.find(params[:id])  #rails makes with magic
          end
  end

  def new
    params.require(:song).permit(:title, :artist_name)
  end
end