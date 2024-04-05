class PagesController < ApplicationController
  include HighVoltage::StaticPage
  before_action :authenticate_user!

  private

  def authenticate
    case params[:id]
    when params[:id]!='welcome'
      authenticate_user!
    end
  end
end
