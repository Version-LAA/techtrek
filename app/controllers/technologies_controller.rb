class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
  end
end
