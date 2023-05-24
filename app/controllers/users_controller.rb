class UsersController < ApplicationController
  def my_profile
    @user = current_user
    @specialties = Specialty.where(user: @user)
    @education = Education.where(user: @user)
    @experiences = Experience.where(user: @user)
  end
end
