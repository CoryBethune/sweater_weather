class BookSearchFacade
  def self.get_books(subject, quantity)
    data = BookSearchService.get_books(subject)
    Book.new(data, quantity)
  end
end
