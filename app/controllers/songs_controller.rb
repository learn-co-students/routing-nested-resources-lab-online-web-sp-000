class SongsController < ApplicationController
  def index
    #In the songs#index action, if the artist can't be found, redirect to the index of artists, 
    #and set a flash[:alert] of "Artist not found."
    if params[:artist_id]
      #to handle not being able to find a record not with find like
      #@songs = Artist.find(params[:artist_id]).songs but
      @artist.find_by(id: params[:artist_id])
        if @artist.nil?
          redirect_to artists_path, alert: "Artist not found"
        else
          @songs = @artist.songs
        end
    else
      @songs = Song.all
    end
  end

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
    #In the songs#show action, if the song can't be found for a given artist,
    # redirect to the index of the artist's songs and set a flash[:alert] of "Song not found."
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])# when filtering nested resources to query for the children through the parent, e.g., @artist.songs.find_by(id: ...)
      if @song.nil?
        redirect_to artist_songs_path(@artist), alert: "Song not found" #it is also possible to assign a flash message as part of the redirection. You can assign :notice, :alert or the general purpose :flash


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

