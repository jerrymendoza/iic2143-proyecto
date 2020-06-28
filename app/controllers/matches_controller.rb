class MatchesController < ApplicationController

    def show
        @match = Match.find(params[:id])
        
        if @match.meeting
            @meeting = @match.meeting
        else
            @meeting = Meeting.new
        end
    end
    
end