class Matcher < ApplicationRecord
  # validates :nombre, :edad, :rut, :imagen, :telefono, :comuna, :descripcion, presence: true
  has_one_attached :imagen
  belongs_to :comuna, optional: true
  has_many :comentarios
  has_many :songs
  has_and_belongs_to_many :gustos
  has_many :matcher1_likes, class_name: 'Like', foreign_key: 'matcher1_id'
  has_many :matcher2_likes, class_name: 'Like', foreign_key: 'matcher2_id'
  has_many :matcher1_matches, class_name: 'Match', foreign_key: 'matcher1_id'
  has_many :matcher2_matches, class_name: 'Match', foreign_key: 'matcher2_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :guardar_gustos
  after_update :guardar_gustos
  before_destroy :eliminar_relaciones

  attr_writer :gustos_ids

  def refresh
    body = {
      grant_type: 'refresh_token',
      refresh_token: refresh_token,
      client_id: Rails.application.credentials.spotify[:client_id],
      client_secret: Rails.application.credentials.spotify[:client_secret]
    }
    # Send request and updated user's access_token
    auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
    auth_params = JSON.parse(auth_response)
    update(access_token: auth_params['access_token'])
  end

  def tracks
    refresh
    songs.delete_all
    header = {
      Authorization: "Bearer #{access_token}"
    }
    response = RestClient.get('https://api.spotify.com/v1/me/tracks', header)
    tracks = JSON.parse(response.body)

    tracks['items'].each do |item|
      @track = Song.new(name: item['track']['name'],
                        uri: item['track']['external_urls']['spotify'],
                        image: item['track']['album']['images'][1]['url'],
                        preview: item['track']['preview_url'])
      songs << @track
      save
    end
  end

  private

  def guardar_gustos
    unless @gustos_ids.nil?
      gustos.destroy_all
      @gustos_ids.each do |gusto_id|
        GustosMatchers.create(gusto_id: gusto_id, matcher_id: id)
      end
    end
  end

  def eliminar_relaciones
    comentarios.destroy_all
    matcher1_likes.destroy_all
    matcher2_likes.destroy_all
    gustos.destroy_all
  end
end
