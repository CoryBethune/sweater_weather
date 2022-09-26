require "rails_helper"

RSpec.describe "Book Search Service" do
  it "gets the books based on a subject search" do
    data = BookSearchService.get_books("denver,co")

    expect(data).to have_key(:numFound)
    expect(data[:numFound]).to be_an(Integer)

    expect(data).to have_key(:docs)
    expect(data[:docs]).to be_an(Array)
    expect(data[:docs].first).to have_key(:title)
    expect(data[:docs].first).to have_key(:isbn)
    expect(data[:docs].first).to have_key(:publisher)

  end
end
