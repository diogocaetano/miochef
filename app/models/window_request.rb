class WindowRequest < ActiveRecord::Base
	validates :initial_time, presence: true
	validates :final_time, presence: true

	validate :is_initial_time_before_final_time?

	def is_initial_time_before_final_time?
		errors.add('Horário Inicial', 'deve ser menor que o Horário Final') unless self.initial_time < self.final_time
	end
end
