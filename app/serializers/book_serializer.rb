class BookSerializer
  i = 0

  def self.initialize(data, location, quantity)
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
            i += 1
            break if i == quantity
          end
        }
      }
    }
  end

end
