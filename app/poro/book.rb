class Book
  attr_reader :total, :books

  def initialize(data)
    @total = data[:numFound]
    @books = data[:docs]
  end
end
