class MatchersController < ApplicationController
  before_action :set_matcher, only: %i[edit show]
  before_action :authenticate_admin_matcher!, only: %i[edit update destroy]
  before_action :set_categories, only: %[index]

  def index
    @matchers = Matcher.where('id NOT IN (?) AND id != (?)', 
                              Like.select(:matcher2_id).where(matcher1: current_matcher), 
                              current_matcher.id)

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
