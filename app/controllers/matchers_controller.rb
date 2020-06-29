class MatchersController < ApplicationController
  before_action :set_matcher, only: %i[edit show verificar_matcher]
  before_action :authenticate_admin_matcher!, only: %i[edit update destroy]
  before_action only: %i[edit update destroy] do
    verificar_matcher(@matcher)
  end
  before_action :set_categories, only: %[index]

  def index
    @matchers = Matcher.where.not(id: current_matcher)
    @gustos = Gusto.all

  end

  def show
    if @matcher.refresh_token
      @matcher.get_tracks
    end
    
  end

  def spotify_request
    # User has clicked "login" button - assemble get request to Spotify to have
    # user authorize application
    query_params = {
      client_id: Rails.application.credentials.spotify[:client_id],
      response_type: "code",
      redirect_uri: "http://localhost:3000/spotify_callback",
      scope: "user-library-read user-library-modify user-top-read user-modify-playback-state playlist-modify-public playlist-modify-private ugc-image-upload user-read-recently-played",
      show_dialog: true
    }
    url = "https://accounts.spotify.com/authorize/"
    # redirects user's browser to Spotify's authorization page, which details
    # scopes my app is requesting
    redirect_to "#{url}?#{query_params.to_query}"
  end
  
  def spotify_callback
    body = {
      grant_type: "authorization_code",
      code: params[:code],
      redirect_uri: "http://localhost:3000/spotify_callback",
      client_id: Rails.application.credentials.spotify[:client_id],
      client_secret: Rails.application.credentials.spotify[:client_secret]
    }
    auth_response = RestClient.post('https://accounts.spotify.com/api/token', body)
    auth_params = JSON.parse(auth_response.body)
    @matcher = Matcher.find(current_matcher.id)
    @matcher.access_token = auth_params["access_token"]
    @matcher.refresh_token = auth_params["refresh_token"]
    @matcher.save
    redirect_to matcher_path(@matcher)
    return
  end

  private

  def set_matcher
    @matcher = Matcher.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end
end
