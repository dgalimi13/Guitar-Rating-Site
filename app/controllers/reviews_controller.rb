class ReviewsController < ApplicationController

def new
    redirect_if_not_logged_in
    if @guitar = Guitar.find_by_id(params[:guitar_id])
        @review = @guitar.reviews.build
    else
        @review = Review.new
    end
end 

def create
    @review = current_user.reviews.build(review_params)
    if @review.save
    redirect_to review_path(@review)
    else
        render :new
    end
end

def show
    @review = Review.find_by_id(params[:id])
end 

def index
    if params[:guitar_id]
        @guitar = Guitar.find_by_id(params[:guitar_id])
        @reviews = @guitar.reviews 
    else
        
    @reviews =  Review.all
    end
end 

def review_params
    params.require(:review).permit(:guitar_id, :content, :stars, :title)
end

end
