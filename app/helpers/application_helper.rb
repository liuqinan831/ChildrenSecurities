module ApplicationHelper

  def account_admin?
    current_account && current_account.admin? ? true : false
  end

  def current_account
    return @current_account if @current_account
    return @current_account = Account.find_by_id(session[:account_id]) if session[:account_id]
    if request.cookies['user'] && (@current_account = Account.validate_cookie(request.cookies['user']))
      session[:account_id] = @current_account.id
      return @current_account
    end
  end

  def account_login?
    current_account ? true : false
  end

  def account_commenter?
    current_account && current_account.commenter? ? true : false
  end

  def full_title(page_title)
    base_title = "儿童安全"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


  def page_description(description)
    base_description = "儿童安全"
    if description.empty?
      base_description
    else
      "#{base_description} | #{description}"
    end
  end
end
