class CompaniesController < ApplicationController
  def new
    types = RailsProject::Application.config.company_types
    @company_types = types.map { |i| [i.humanize, i] }
  end

  def registration_form
    @company = Company.new type: params[:type].camelize
    render 'companies/registration_form/' + params[:type], layout: false
  end
end
