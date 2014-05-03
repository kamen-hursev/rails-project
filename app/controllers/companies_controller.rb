class CompaniesController < ApplicationController
  before_action :brokers_selected?, only: [:new, :create]

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
    @company.broker_ids = session[:brokers]
    result = @company.save
    if result
      session.delete :brokers
      after_create_redirect
    else
      load_company_types
      render 'new'
    end
  end

  private

  def brokers_selected?
    unless session.key? :brokers
      redirect_to start_registration_path, notice: 'Please select brokers'
    end
  end

  def after_create_redirect
    if @company.instance_of? LimitedCompany
      path = new_document_path company_id: @company.id
    else
      path = thank_you_path
    end
    redirect_to path
  end

  def load_company_types
    types = RailsProject::Application.config.company_types
    @company_types = types.map { |i| [i.humanize, i] }
  end

  def company_params
    @type = params[:type]
    method_name = (@type + '_params').to_sym
    remove_template_inputs @type
    self.send method_name
  end

  def charity_params
    params.require(@type).permit(
      :type,
      :name,
      :address,
      :identification_number,
      :email
    )
  end

  def limited_company_params
    params.require(@type).permit(
      :type,
      :name,
      :identification_number,
      :email,
      people_attributes: [:name]
    )
  end

  def partnership_params
    params.require(@type).permit(
      :type,
      :name,
      :address,
      :identification_number,
      people_attributes: [:name]
    )
  end

  def public_limited_company_params
    params.require(@type).permit(
      :type,
      :name,
      :listed_on_exchange,
      :identification_number
    )
  end

  def trust_params
    params.require(@type).permit(
      :type,
      :name,
      :address,
      people_attributes: [:name]
    )
  end

  def sole_trader_params
    params.require(@type).permit(
      :type,
      :name,
      :address
    )
  end

  def remove_template_inputs(type)
    if params[type].key?('people_attributes')
      params[type]['people_attributes'].delete('--replace--')
    end
  end
end
