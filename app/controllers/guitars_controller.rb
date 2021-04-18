class GuitarsController < ApplicationController
     before_action :set_guitar, only:[:show, :edit, :update]

    def index
    @guitars = Guitar.order_by_rating.includes(:make)
    end 

    def new
    @guitar = Guitar.new
    @guitar.build_make
    end

    def create
        @guitar = Guitar.new(guitar_params)
        @guitar.user_id = session[:user_id]
        if @guitar.save
        redirect_to guitar_path(@guitar)
        else
            @guitar.build_make
            render :new
        end
    end 

    def show
    end

    def edit
    end

    def update
        if @guitar.update(guitar_params)
            redirect_to guitar_path(@guitar)
          else
            render :edit
          end
    end

    private

    def guitar_params
        params.require(:guitar).permit(:kind, :description, :make_id, make_attributes: [:name])
    end 

    def set_guitar
        @guitar = Guitar.find_by(params[:id])
        redirect_to guitars_path if !@guitar
    end

end
