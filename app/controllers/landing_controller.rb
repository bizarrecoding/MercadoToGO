class LandingController < ApplicationController
  before_action :authenticate_vendor!, only: [:vendor]
    
  def home
  end
  
  def vendor
  end
  
  def about
  end
end
