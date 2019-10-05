class SongsController < ApplicationController
  def index
    if ! params[:artist_id].blank?
      if Artist.artist_exist?(params[:artist_id])
        @songs=Song.where(artist_id: params[:artist_id])
      else 
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show
    @song = Song.find(params[:id])
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

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

