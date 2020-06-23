class MatchersController < ApplicationController
  before_action :set_matcher, only: %i[edit show]
  before_action :authenticate_admin_matcher!, only: %i[edit update destroy]

  def index
    @matchers = Matcher.where.not(id: current_matcher)
  end

  def show; end

  private

  def set_matcher
    @matcher = Matcher.find(params[:id])
  end
end
