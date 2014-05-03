class CompaniesController < ApplicationController
  def new
    load_company_types
  end

  def registration_form
    return unless request.xhr?
    company = Company.new type: params[:type].camelize
    render partial: 'companies/registration_form/' + params[:type],
           locals: { company: company, type: params[:type] }
  end

  def create
    @company = Company.new company_params
    @company.broker_ids = session[:brokers] # probably should move this in params
    result = @company.save
    if result
      redirect_to root_path, notice: 'Company registered successfully.'
    else
      load_company_types
      render 'new'
    end
  end

  private

  def load_company_types
    types = RailsProject::Application.config.company_types
    @company_types = types.map { |i| [i.humanize, i] }
  end

  def company_params
    @type = params[:type]
    method_name = (@type + '_params').to_sym
    self.send(method_name)
  end

  def charity_params
    params.require(:charity).permit(
      :type,
      :name,
      :address,
      :identification_number,
      :email
    )
  end

  def limited_company_params
    params.require(:limited_company).permit(
      :type,
      :name,
      :identification_number,
      :email,
      people_attributes: [:name]
    )
  end

  def partnership_params
    params.require(:partnership).permit(
      :type,
      :name,
      :address,
      :identification_number,
      people_attributes: [:name]
    )
  end

  def public_limited_company_params
    params.require(:public_limited_company).permit(
      :type,
      :name,
      :listed_on_exchange,
      :identification_number
    )
  end

  def trust_params
    params.require(:trust).permit(
      :type,
      :name,
      :address,
      people_attributes: [:name]
    )
  end

  def sole_trader_params
    params.require(:sole_trader).permit(
      :type,
      :name,
      :address
    )
  end
end
