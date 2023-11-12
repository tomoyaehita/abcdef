class TopicsController < ApplicationController
    def index
        @sports = Sport.all
    end
end
