class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]
  def home
    @agencies = Agency.all[0..3]
  end
end
