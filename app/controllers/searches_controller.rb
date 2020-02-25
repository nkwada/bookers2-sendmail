class SearchesController < ApplicationController
def search
	if params[:selected] == 'User'
		# @users = User.search(params[:search])
	    search = params[:search]
	    if params[:method] == '1'
	    	@users = User.where(['name LIKE ?', "#{search}"])
		elsif params[:method] == '2'
			@users = User.where(['name LIKE ?', "#{search}%"])
		elsif params[:method] == '3'
			@users = User.where(['name LIKE ?', "%#{search}"])
		elsif params[:method] == '4'
			@users = User.where(['name LIKE ?', "%#{search}%"])
		end
	elsif params[:selected] == 'Book'
		# @books = Book.search(params[:search])
		search = params[:search]
	    if params[:method] == '1'
	    	@books = Book.where(['title LIKE ?', "#{search}"])
		elsif params[:method] == '2'
			@books = Book.where(['title LIKE ?', "#{search}%"])
		elsif params[:method] == '3'
			@books = Book.where(['title LIKE ?', "%#{search}"])
		elsif params[:method] == '4'
			@books = Book.where(['title LIKE ?', "%#{search}%"])
		end
	end
end

end
