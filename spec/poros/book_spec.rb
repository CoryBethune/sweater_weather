require "rails_helper"

RSpec.describe "Book Poro" do
  it "creates an instance of a Book" do
    results = BookSearchFacade.get_books("denver,co")

    expect(results).to be_an(Book)
  end
end
