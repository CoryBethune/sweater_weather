class BookSearchFacade
  def self.get_books(subject)
    data = BookSearchService.get_books(subject)
    Book.new(data)
  end
end
