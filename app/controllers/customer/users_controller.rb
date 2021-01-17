class Customer::UsersController < Customer::MainController
	before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
	
	def index
	end
	
	def show
		
	end

	def new
		@user = User.new
	end

	def edit
		
	end

  def create
    @user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
			flash[:success] = "ユーザー情報を更新しました。"
			redirect_to @user
    else
      render :edit      
    end
	end

	def destroy
	end

  private

    def user_params
      params.require(:user).permit(:name, :name_kana, :tellnumber, :email, :password, :password_confirmation, :employee)
		end

		def set_user
      @user = User.find(params[:id])
    end
		
		def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
		end

		def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end