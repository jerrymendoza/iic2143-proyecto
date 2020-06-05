class MatchersController < ApplicationController
  before_action :set_matcher, only: [:show]
  before_action :authenticate_admin_propietario_local!, only: %i[edit update destroy]
  def index
    @matchers = Matcher.where.not(id: current_matcher)
  end

  def show

  end

  private

  def set_matcher
    @matcher = Matcher.find(params[:id])
  end
end
