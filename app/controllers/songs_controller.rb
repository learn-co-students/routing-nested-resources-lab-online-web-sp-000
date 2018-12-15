class SongsController < ApplicationController
  def index
    if params[:artist_id]
      if Artist.find_by(id: params[:artist_id])
        @songs = Artist.find_by(id: params[:artist_id]).songs
      else
        redirect_to artists_path, notice: "Artist not found."
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist.songs.find_by(id: params[:id])
        @song = Song.find_by(id: params[:id])
      else
        flash[:alert] = "Song not found."
        redirect_to artist_songs_path(@artist)
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

#show action, if the song can't be found for a given artist, redirect to the index of the artist's songs and set a flash[:alert] of "Song not found."


# => {"controller"=>"songs", "action"=>"show", "artist_id"=>"1", "id"=>"8"}
