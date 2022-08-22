class MusicController < ApplicationController

  def new

  end
  def index
    @genres = Genre.all
    @artists = Artist.all
    @albuns = Album.all
    @tracks = Track.all
  end

  def create

    if params['file']
      file = params["file"].tempfile.path
      @musicas = File.open(file){ |yf| YAML::load( yf ) }

      @musicas["genres"].each do |g|
        @genre = Genre.new(name: g["name"])
        @genre.save

        g["artists"].each do |a|
          @artist = Artist.new(name: a["name"], parent_id: @genre.id)
          @artist.save

          a["albums"].each do |al|
            @album = Album.new(name: al["name"], parent_id: @artist.id)
            @album.save

            al["tracks"].each do |t|
              @track = Track.new(name: t["name"], parent_id: @album.id)
              @track.save
            end
          end
        end
      end
      flash[:notice] = "Arquivo carregado com sucesso!"
      redirect_to root_path
      #genre = Genre.create(name: musicas["genres"][0]["name"])
      #genre.save

      #artist = Artist.create(name: musicas["genres"][0]["artists"][0]["name"])
      #artist.save

      #album = Album.create(name: musicas["genres"][0]["artists"][0]["albums"][0]["name"])
      #album.save

      #track = Track.create(name: musicas["genres"][0]["artists"][0]["albums"][0]["tracks"][0]["name"])
      #track.save

      #binding.pry
      #
      #redirect_to root_path
    else
      flash[:alert] = "Escolha um arquivo yaml!"
      redirect_to root_path
    end

  end

  def show
  end
end
