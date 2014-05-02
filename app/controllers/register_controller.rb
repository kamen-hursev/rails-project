class RegisterController < ApplicationController
  def select_brokers
    @brokers = Broker.all
  end

  def submit_brokers
    brokers params[:brokers]
  end
end
