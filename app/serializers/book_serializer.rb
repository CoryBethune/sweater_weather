class BookSerializer

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
        }
      }
    }
  end

end
