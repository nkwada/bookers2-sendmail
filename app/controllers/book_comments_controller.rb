class BookCommentsController < ApplicationController
	def create
	    @book = Book.find(params[:book_id])
	    @book_comment = current_user.book_comments.new(book_comment_params)
	    @book_comment.book_id = @book.id
	    @book_comment.save
	    # if @book_comment.save
	    	# render :index, notice: "successfully created comment!"
		# else
		# 	redirect_back(fallback_location: root_path)
		# end
	end

	def destroy
		@book = Book.find(params[:book_id])
        @book_comment = BookComment.find(params[:comment_id])
        @book_comment.destroy
        # render :index
	end

private
def book_comment_params
    params.require(:book_comment).permit(:comment)
end

end
