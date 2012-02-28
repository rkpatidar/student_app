module ApplicationHelper
  
  def current_user
    return session[:student]
  end
  
  def remaining_books 
    Books.find_by_sql("select books.id,books.book_name from books where id not in(select book_id from issuedbooks)")  
  end
  
  def allstudent
      Books.find_by_sql("select * from students where role like 'u' ")  
  end
  
  def issued_book_list
    Books.find_by_sql("select books.id,books.book_name from books where id in(select book_id from issuedbooks where is_issued=true)")      
  end
  
  def student_having_book
    Books.find_by_sql("select students.id,students.email from students where students.id in(select student_id from issuedbooks where is_issued=true)")   
  end
  
    
end
