class CommunityController < ApplicationController
  helper :profile

  def index
    @title = "Community"
    @letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
    if params[:id]
      @initial = params[:id]
      specs = Spec.find(:all,
                        :conditions => ["last_name like ?", @initial+'%'],
                        :order => "last_name, first_name")
      @users = specs.collect { |spec| spec.user }
    end
  end

  def browse
  end

  def search
  end
end

