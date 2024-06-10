class Api::V1::ScreenshotsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    screenshots = Screenshot.all
    render json: screenshots
  end
end
