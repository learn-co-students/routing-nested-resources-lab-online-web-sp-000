class SongsController < ApplicationController
  def index
    if params[:artist_id]
    # binding.pry
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist.nil?
        flash[:error] = "Artist not found"
        redirect_to artists_path
      else
        @songs = @artist.songs
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
    # binding.pry
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist.songs.find_by(id: params[:id]).nil?
        flash[:alert] = "Song not found"
        redirect_to artist_songs_path(@artist)
      else
        @song = @artist.songs.find_by(id: params[:id])
      end
    else
      @song = Song.find_by(id: params[:id])
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

#   def artists_index
#     @artist = Artist.find(params[:id])
# binding.pry
#     if @artist
#       @songs = @artist.songs
#       render template: 'songs/index'
#     else
#       redirect_to artists_path
#     end
#   end
 
#   def artist
#     @artist = Artist.find(params[:id])
 
#     # Note that because ids are unique by table we can go directly to
#     # song.find — no need for @artist.songs.find...
#     @song = Song.find(params[:song_id])
#     render template: 'songs/show'
#   end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

