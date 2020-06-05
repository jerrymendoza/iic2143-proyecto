class MatchersController < ApplicationController
  before_action :set_matcher, only: [:show]
  before_action :authenticate_admin_propietario_local!, only: %i[edit update destroy]
  def index
    @matchers = Matcher.all
  end

  def show
    @gustos = Gusto.all
  end

  private

  def set_matcher
    @matcher = Matcher.find(params[:id])
  end
end
