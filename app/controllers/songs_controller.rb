class SongsController < ApplicationController

  def index

    if params[:artist_id]

      # search for artist
      @artist = Artist.find_by(id: params[:artist_id])

      # specifically looking for artist with find_by
      if @artist.nil?
        # if artist comes up as not there == nil

        flash[:alert] = "Artist not found."
        #  execute message
        redirect_to artists_path
        # go to artist index page if artist can't be found
      else
        @songs = @artist.songs
      end
    else
      @songs = Song.all
    end
  end

  def show
    # flash[:alert] = "Song not found."
    # binding.pry
    if params[:artist_id]
      # 1. check for artist_id within params
      # binding.pry
        @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])
      # puts @song
      # @song is checking to see if its sond.id => params[:id]
      # binding.pry
      # we're finding an instance of a song by locating  song's  artist.id
      #  finding songs => artist, then artist.id
      if @song.nil?
        flash[:alert] = "Song not found."
        # exectue message
        redirect_to artist_songs_path(@artist)
        # binding.pry
      end
    else
      @song = Song.find(params[:id])
      # redirect_to song_path(@song)
    end
    # @song = Artist.find(params[:artist_id]).song
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
