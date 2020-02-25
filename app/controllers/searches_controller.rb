class SearchesController < ApplicationController
def search
	@users = @q.result(distinct: true)
	@books = @q.result(distinct: true)
end
end
