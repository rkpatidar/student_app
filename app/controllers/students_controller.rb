class StudentsController < ApplicationController
 
 # layout "after_login_layout", :only => [:lougout,:index,:show,:new,:edit,:create,:update,:distroy]
  
 # layout :another_by_method

#  def another_by_method
#     if session[:student].nil?
#      "standard"      
#    else
#      "after_login_layout"
#    end
#  end

 
 
  
  def logout
    session[:student]=nil;
    flash[:notice] = "Logout Successfully"
    redirect_to :action => 'login'
  end
   
  def home
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json =>@students}

    end
  end
   
  def login
    @student = Student.new
    respond_to do |format|
      format.html # login.html.erb
      format.json { render :json => @student }
    end
  end
   
  def check_login
    username = params[:student][:user]
    password = params[:student][:password]
    student = Student.check_password(username,password)
    if student.nil?
      #redirect_to students_login_path
      flash[:notice] = "User id or user password is not correct. please enter valid id and password"
      redirect_to :action => 'login'
    else
      session[:student] = student
      if student.is_admin? 
        flash[:notice] = "Welcome  "+student[:first_name].to_s+" "+student[:last_name].to_s
        redirect_to :action => 'index'
      else
         if student.is_user?
          flash[:notice] = "Welcome  "+student[:first_name].to_s+" "+student[:last_name].to_s
          redirect_to :action => 'index'
         else
             flash[:notice] = "Welcome  "+student[:first_name].to_s+" "+student[:last_name].to_s
              redirect_to :controller=>'book', :action=>'index'
         end
      end   
    end
  end
   
  def index
    #  if session[:student].nil?
    #    flash[:notice]="session expired"
    #    redirect_to :action=>'login' and return
    @students = Student.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json =>@students}
    end
  end

  def show
    @student = Student.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, :notice => 'Student was successfully created.' }
        format.json { render :json => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, :notice => 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end 
end
