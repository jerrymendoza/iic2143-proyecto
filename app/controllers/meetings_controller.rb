class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy enviar_aceptar_por_matcher]
  before_action :set_match, only: %i[create]
  before_action :set_locals, only: %i[new create edit update]
  after_action :enviar_aceptar_por_matcher, only: %i[create update]

  def new
  end
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = []
    matches_de_matcher = Match.where('matcher1_id = (?) OR matcher2_id = (?)', current_matcher.id, current_matcher.id)

    matches_de_matcher.each do |match_i|
      meeting = Meeting.where(match: match_i)
      @meetings << meeting[0] if meeting
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show; end

  # GET /meetings/1/edit
  def edit; end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.match = @match
    @meeting.update_attributes(aceptado_1: false)
    @meeting.update_attributes(aceptado_2: false)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @match, notice: 'Tu cita fue creada.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        @meeting.update_attributes(aceptado_1: false)
        @meeting.update_attributes(aceptado_2: false)
        format.html { redirect_to meetings_path, notice: 'Se actualizó la cita, espera que el otro matcher responda' }
        format.json { render :show, status: :ok, location: meetings_path }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Se eliminó la cita' }
      format.json { head :no_content }
    end
  end

  def enviar_aceptar_por_matcher
    @meeting.aceptar_por_matcher current_matcher
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_locals
    @locals = Local.where(aceptado: true)
  end

  # Only allow a list of trusted parameters through.
  def meeting_params
    params.require(:meeting).permit(:local_id, :fecha, :hora)
  end
end
