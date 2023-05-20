class MentorsController < ApplicationController
  def index
  end

  def show
    @mentor = User.find(params[:id])
  end
end
