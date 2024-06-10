class Api::V1::WebsitesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    website = Website.new(website_params)
    if website.save
      render json: website, status: :created
    else
      render json: { error: 'Failed to create Website' }, status: :unprocessable_entity
    end
  end

  def index
    websites = Website.all
    render json: websites
  end

  private

  def website_params
    params.require(:website).permit(:address)
  end
end
