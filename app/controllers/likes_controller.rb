class LikesController < ApplicationController
  before_action :set_like, only: %i[show edit update destroy]
  before_action :authenticate_matcher!, only: %i[new create index]

  # GET /likes
  # GET /likes.json
  def index
  end

  # GET /likes/1
  # GET /likes/1.json
  def show; end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit; end

  # POST /likes
  # POST /likes.json
  def create
    matcher2 = Matcher.find(params[:matcher])
    @like = Like.new(matcher1: current_matcher, matcher2: matcher2)

    respond_to do |format|
      if @like.save
        #find match
        find1 = Like.where('matcher1_id = (?) AND matcher2_id = (?)', current_matcher.id, matcher2.id).take
        find2 = Like.where('matcher1_id = (?) AND matcher2_id = (?)', matcher2.id, current_matcher.id).take
        
        if find1 && find2
          puts "**** MATCH! ****"
          @match = Match.new(matcher1: current_matcher, matcher2: matcher2)
          if @match.save
            redirect_to matches_path(@match.id)
            return
          else
            puts "algo paso con este match"
          end
          #redirect_to url_for(:controller => :meetings, :action => :new) 
          return
        else
          prev = Rails.application.routes.recognize_path(request.referrer)
          redirect_to controller: prev[:controller], action: prev[:action]
          return 
        end

        format.html { redirect_to @like, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def like_params
    params.require(:matcher)
  end
end
