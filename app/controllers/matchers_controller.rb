class MatchersController < ApplicationController
  before_action :set_matcher, only: %i[edit show verificar_matcher]
  before_action :authenticate_admin_matcher!, only: %i[edit update destroy]
  before_action only: %i[edit update destroy] do
    verificar_matcher(@matcher)
  end
  before_action :set_categories, only: %[index]

  def index
    if matcher_signed_in?
      @matchers = Matcher.where('id NOT IN (?) AND id != (?)', 
                              Like.select(:matcher2_id).where(matcher1: current_matcher), 
                              current_matcher.id)
    else
      @matchers = Matcher.all
    end

    @gustos = Gusto.all
  end

  def show; end

  private

  def set_matcher
    @matcher = Matcher.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end
end
