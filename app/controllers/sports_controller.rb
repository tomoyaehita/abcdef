class SportsController < ApplicationController
    def index
        if params[:search] == nil
          @sports= Sport.all
        elsif params[:search] == ''
          @sports= Sport.all
        else
          #部分検索
          @sports = Sport.where("name LIKE ? ",'%' + params[:search] + '%')
        end
  
    end
    def new
      @sport = Sport.new
    end

    def kensaku
      if params[:search] == nil
        @sports= Sport.all
      elsif params[:search] == ''
        @sports= Sport.all
      else
        #部分検索
        @sports = Sport.where("name LIKE ? ",'%' + params[:search] + '%')
      end

    end    
    
    def show
      @sport = Sport.find(params[:id])
    end

      def create
        sport = Sport.new(sport_params)
        if sport.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    

      def edit
        @sport = Sport.find(params[:id])
      end

      def update
        sport = Sport.find(params[:id])
        if sport.update(sport_params)
          redirect_to :action => "show", :id => sport.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        sport = Sport.find(params[:id])
        sport.destroy
        redirect_to action: :index
      end

      private
      def sport_params
        params.require(:sport).permit(:name, :address, :about, :image)
      end
end
