require "rails_helper"

RSpec.describe "Book Serializer" do
  it "returns a collection of books related to a location" do
    results = BookSearchFacade.get_books("denver,co")
    collection = BookSerializer.book_collection(results, "denver,co", 1)
    binding.pry
    expect(collection)
  end
end
