class MatchersController < ApplicationController
  before_action :set_matcher, only: [:show]
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
