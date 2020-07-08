class MatchesController < ApplicationController
  def index
    @matches = Match.where(matcher1: current_matcher).or(Match.where(matcher2: current_matcher))
  end

  def show
    @match = Match.find(params[:id])
    @meeting = Meeting.new
    @locals = Local.where(aceptado: true)
    @meeting = @match.meeting if @match.meeting
  end
end
