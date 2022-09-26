require "rails_helper"

RSpec.describe "Book Search Facade" do
  it "returns a book poro after receiving a book search service call" do
    data = BookSearchFacade.get_books("denver,co")

    expect(data).to be_an(Book)
  end
end
