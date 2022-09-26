class BookSearchController < ApplicationController

  def show
    results = BookSearchFacade.get_books(params[:location])
    BookSerializer.new(results, params[:quantity])
  end
end
