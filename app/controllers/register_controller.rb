class RegisterController < ApplicationController
  def select_brokers
    @brokers = Broker.all
  end

  def submit_brokers
    company = Company.new
    company.broker_ids = params[:brokers]
    company.validate_number_of_brokers
    respond_to do |format|
      if company.errors[:brokers].empty?
        format.json { render json: { success: true } }
      else
        format.json { render json: { success: false, error: company.errors[:brokers][0] } }
      end
    end
  end
end
