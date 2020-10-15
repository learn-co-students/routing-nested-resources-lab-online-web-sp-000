class SongsController < ApplicationController
  def index
    if params[:artist_id] #First, search to see if the user entered an artist id.
      @artist = Artist.find_by_id(params[:artist_id])
      if !@artist #If they did, but the id is not found, redirect to the artist index page.
        flash[:alert] = "Artist not found"
        redirect_to artists_path
      else #If it does exist, the page of the artist's songs loads
        @songs = @artist.songs
      end
    else #If the user never entered an artist id, then just send back the index of songs.
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id] #Like before, we check to see if the user entered an artist's id
      @artist = Artist.find(params[:artist_id]) #We set our variable equal to this particular artist_id
      @song = @artist.songs.find_by(id: params[:id]) #We also set a 'song' variable equal to the id of the song that belongs to this artist
      if @song.nil? #If the artist does not have this song id...
        flash[:alert] = "Song not found"
        redirect_to artist_songs_path #...we present our error message and redirect to the artist's song list
      end
    else
      @song = Song.find(params[:id]) #If no artist_id is present, we simply display the song details
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

