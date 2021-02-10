class SongsController < ApplicationController
    before_action :set_song, only: %i[ show edit update destroy ]
    
    def index
        @songs = Song.all
    end

    def show
    end

    def edit
    end

    def update
        if @song.update(strong_params(:title, :released, :release_year, :artist_name, :genre))
            redirect_to :song
        else
            render :new
        end
    end

    def destroy
        @song.destroy
        redirect_to songs_path

    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(strong_params(:title, :released, :release_year, :artist_name, :genre))
        if @song.valid?
            @song.save
            redirect_to @song
        else
            render :edit
        end

    end

    private

    def strong_params(*args)
        params.require(:song).permit(*args)
    end

    def set_song
        @song = Song.find_by(id: params[:id])
    end

end
