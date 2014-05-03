class DocumentsController < ApplicationController
  def new
    @document = Document.new company_id: params[:company_id]
  end

  def create
    @document = Document.new document_params

    if @document.save
      redirect_to thank_you_path
    else
      render 'new'
    end
  end

  private

  def document_params
    params.require(:document).permit(:file, :company_id)
  end
end
