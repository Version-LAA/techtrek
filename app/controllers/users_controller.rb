class UsersController < ApplicationController
  def my_profile
    @profile_page = true
    @user = current_user
    @background_color = "white"
    @specialties = Specialty.where(user: @user).order(skill_level: :desc)

    @education = Education.where(user: @user)
    @experiences = Experience.where(user: @user)
  end
end
