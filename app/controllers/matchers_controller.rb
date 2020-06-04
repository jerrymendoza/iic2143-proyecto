class MatchersController < ApplicationController
before_action :set_matcher, only: [:show]
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
