class BrokersController < ApplicationController
  def select
    @brokers = Broker.all
  end

  def submit
    company = Company.new(broker_ids: params[:brokers])
    company.validate_number_of_brokers
    respond_to do |format|
      if company.errors[:brokers].empty?
        session[:brokers] = params[:brokers]
        format.json { render json: { success: true } }
      else
        format.json { render json: { success: false, error: company.errors[:brokers][0] } }
      end
    end
  end
end
