class Document < ActiveRecord::Base
  belongs_to :company

  has_attached_file :file

  validates_attachment :file, presence: true
  do_not_validate_attachment_file_type :file

  validate :valid_company_type

  private

  def valid_company_type
    unless company.instance_of? LimitedCompany
      errors.add(:company, ' should be Limited Company in order to upload a document')
    end
  end
end
