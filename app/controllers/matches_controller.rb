class MatchesController < ApplicationController

	def index
		@matches = Match.where(matcher1: current_matcher).or(Match.where(matcher2: current_matcher))
	end 

    def show
        @match = Match.find(params[:id])
        @locals = Local.all
        @meeting = Meeting.new
        
        if @match.meeting
            @meeting = @match.meeting
        end
    end
    
end