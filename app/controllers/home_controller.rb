class HomeController < ApplicationController
  def index
    render :text =>'home page'
  end

  def show_signin
    @account = Account.new
  end

  def signin
    params.permit!
    @account = Account.new(params[:account])
    if login_account = Account.authenticate(@account.email, @account.password)
      session[:account_id] = login_account.id
      response.set_cookie('user', {:value => login_account.encrypt_cookie_value, :path => "/", :expires => 2.weeks.since, :httponly => true}) if params[:remember_me]
      flash[:notice] = '成功登录'
      redirect_to root_path
    else
      # retry 5 times per one hour
      # APP_CACHE.increment("#{CACHE_PREFIX}/login_counter/#{request.ip}", 1, :expires_in => 1.hour)
      render 'home/show_signin'
    end
  end

  private
    def account_params
      params.require(:account).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
