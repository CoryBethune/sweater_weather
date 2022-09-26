class BookSearchController < ApplicationController

  def show(subject)
    results = BookSearchFacade.get_books(subject)
  end
end
