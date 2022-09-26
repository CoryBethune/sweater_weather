class BookSearchController < ApplicationController

  def show
    results = BookSearchFacade.get_books(params[:location], params[:quantity])
    Book.new(results)
  end
end
