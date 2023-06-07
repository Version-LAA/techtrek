class UsersController < ApplicationController
  def my_profile
    @user = current_user
    @specialties = Specialty.where(user: @user).order(skill_level: :desc)

    @education = Education.where(user: @user)
    @experiences = Experience.where(user: @user)
  end
end
