class ReviewsController < ApplicationController

def new
  @guitar = Guitar.find_by_id(params[:id])
  @review = @guitar.build_review
end 

def index

end 

end
