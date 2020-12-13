class Employee < ApplicationRecord
	has_attached_file :image, :styles => {:thumb => "200x250>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ 
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|png)$/, :message => 'file type is not allowed (only jpg|jpeg/png images)'
	validates_uniqueness_of :email_address
	validates :phone, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }


	def self.to_csv
    attributes = %w{id employee_id}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |car|
        csv << attributes.map{ |attr| car.send(attr) }
      end
    end
  end
end
