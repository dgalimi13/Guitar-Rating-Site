class ReviewsController < ApplicationController

def new
  @guitar = Guitar.find_by_id(params[:guitar_id])
  @review = @guitar.reviews.build
end 

def index

end 

def review_params
    params.require(:review).permit(:guitar_id, :content, :stars, :title)
end

end
