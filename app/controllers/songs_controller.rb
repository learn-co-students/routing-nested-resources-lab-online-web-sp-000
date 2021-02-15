require 'pry'
class SongsController < ApplicationController
  def index
    #binding.pry
    @songs = Song.all
     if params[:artist_id] #if there is an artist id -
     if Artist.find_by(id: params[:artist_id]) #if  either artist is found  -
     else          #artist is not found
       flash[:notice] = "Artist not found"
       redirect_to artists_path
     end
   else  #there is no artist id
     @songs = Song.all
end
end
  def show
    #binding.pry
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.find_by(id: params[:id])
        if @song.nil?
      flash[:alert] = "Song not found"
      redirect_to artist_songs_path
    end
    else
      @song = Song.find(params[:id])
  end
end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
