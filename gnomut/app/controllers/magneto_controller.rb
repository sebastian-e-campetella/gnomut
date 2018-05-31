class MagnetoController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def stats
    ratio = Rails.cache.fetch("ratio", expires_in: 5.minutes) do
      Magneto.ratio
    end
    render json: ratio, status: :success
  end

  def mutant
    if params["dna"].present?
      magneto = Magneto.verify_dna!(params[:dna])
      if magneto.persisted?
        render json: {},status: :ok
      else
        render json: {}, status: :forbidden
      end
    else
      render json: {}, status: :forbidden 
    end
  end
end
