class Bridge < ActiveRecord::Base
	belongs_to :grade
	belongs_to :subject
	belongs_to :employee
	has_many :marksheets

	def title
		self.grade.name+'-'+self.subject.name
	end
end
