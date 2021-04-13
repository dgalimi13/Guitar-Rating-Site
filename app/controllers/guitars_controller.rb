class GuitarsController < ApplicationController

def index

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
        render :new
    end
end 

private

def guitar_params
    params.require(:guitar).permit(:kind, :description, :make_id, make_attributes: [:name])
end 

end
