class UsersController < ApplicationController

  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
      @user = User.find(params[:id])
      @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    # email verification code for new users
    @user.verification_code = secure_hash( Time.now.to_s.split(//).sort_by {rand}.join )
    @user.permalink = @user.name.gsub(/\s/, "-").gsub(/[^\w-]/, '').downcase
    if @user.save
      sign_in @user
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Welcome to rgov!"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end
  
  def edit
  	@title = "Edit user"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def forgot
  if request.post?	
  	user = User.find_by_email(params[:user][:email])
    if user
        user.reset_password_code_until = 1.day.from_now
        user.reset_password_code = secure_hash( Time.now.to_s.split(//).sort_by {rand}.join )
		user.save!
        UserMailer.reset_notification(user).deliver
        flash[:notice] = "Reset code sent to #{user.email}"
      else
        flash[:notice] = "#{params[:user][:email]} does not exist in system"
      end
      # render 'forgot'
  	end
  end
  
  def reset
    user = User.find_by_reset_password_code(params[:reset_password_code])
    if user && user.reset_password_code_until && Time.now < user.reset_password_code_until
    	sign_in(user)
    	self.current_user = user 
    	redirect_to edit_user_path(user)
    else
    	redirect_to root_path
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def verify
  	user = User.find_by_verification_code(params[:verification_code])
    if user
    	user.verified = true
    	user.save
    	redirect_to user
    else
    	redirect_to root_path
    end
  end

  private

	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

	def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
