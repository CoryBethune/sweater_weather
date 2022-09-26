class BookSearchController < ApplicationController

  def show
    results = BookSearchFacade.get_books(params[:location])
    BookSerializer.new(results, params[:location], params[:quantity])
  end
end
