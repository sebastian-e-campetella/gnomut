class MagnetoController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json, :plain

  def stats
    ratio = Rails.cache.fetch("ratio", expires_in: 5.minutes) do
      Magneto.ratio
    end
    render json: ratio.to_json, status: :ok
  end

  def mutant
    if params["dna"].present?
      magneto = Magneto.verify_dna!(params[:dna])
      if magneto.persisted?
#        render json: nil,status: :ok
        head :ok
      else
#        render json: nil, status: :forbidden
        head :forbidden
      end
    else
#      render json: nil, status: :forbidden 
      head :forbidden
    end
  end

  def welcome
    render plain: "hola"
  end
end
