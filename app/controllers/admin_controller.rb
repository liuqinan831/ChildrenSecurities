class AdminController < ApplicationController

  before_action do
    halt 403 unless account_admin?
  end

  def index
    render 'admin/index'
  end

  def new
  end

  def create
  end

  def edit
  end

  def blogs
  end
end
