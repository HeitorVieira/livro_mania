class MyBooksController < ApplicationController
  def find
    puts params[:search_string]
    puts params[:search_string]
    puts params[:search_string]
    puts params[:search_string]
    
    books = Book.find_all_by_title(params[:search_string])
    books.each do |book|
      @my_books = MyBook.find_all_by_book_id(book.id)
    end
    
    @my_books.sort_by { |my_book| current_user.distance_to(my_book.owner) }
  end
end