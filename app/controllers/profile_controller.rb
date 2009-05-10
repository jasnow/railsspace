class ProfileController < ApplicationController

  def index
    @title = "RailsSpace Profiles"
  end

  def show
    @hide_edit_links = true
    screen_name = params[:screen_name]
    @user = User.find_by_screen_name(screen_name)
    if @user
      @title = "My RailsSpace Profile for #{screen_name}"
      @spec = @user.spec ||= Spec.new
      @faq = @user.faq ||= Faq.new
    else
      flash[:notice] = "No user #{screen_name} at RailsSpace!"
      redirect_to :action => "index"
    end
  end
end