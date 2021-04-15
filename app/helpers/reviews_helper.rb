module ReviewsHelper

    def display_header(review)
        if params[:guitar_id]
            content_tag(:h1, "Add a Review for #{review.guitar.kind} -  #{review.guitar.make.name}")
        else
          content_tag(:h1, "Create a review")
        end
      end
    end


