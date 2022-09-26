class Book
  attr_reader :total, :books
  def initialize(data, quantity)
    @total = data[:numFound]
    @books = data[:docs]
  end
end
