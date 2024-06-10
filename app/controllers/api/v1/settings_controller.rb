class Api::V1::SettingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    setting = Setting.first_or_create
    if setting.update(setting_params)
      render json: setting
    else
      render json: { error: 'Failed to update settings' }, status: :unprocessable_entity
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:interval, :retention)
  end
end
