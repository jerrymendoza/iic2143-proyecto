class MatchersController < ApplicationController
  def index
    @matchers = Matcher.all
  end
end
