class BookSerializer

  def self.initialize(data, location, quantity)
    i = 1
    {
      data: {
        id: "null",
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: nil,
            temperature: nil
                    },
          total_books_found: data.total,
          books: data.books.map do |book|
            {
              isbn: book[:isbn],
              title: book[:title],
              publisher: book[:publisher]
            }
            break if i == quantity
            i += 1
          end
        }
      }
    }
  end

end
