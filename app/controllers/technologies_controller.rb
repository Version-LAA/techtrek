class TechnologiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @technologies = Technology.all
  end
end
