class HomeController < ApplicationController
  def index
  	redirect_to('/api_docs/swagger/')
  end
end
