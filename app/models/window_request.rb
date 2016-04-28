class WindowRequest < ActiveRecord::Base

	validates :initial_time, presence: true
	validates :final_time, presence: true

	validate :is_initial_time_before_final_time?

	validate :is_clone?

	def is_initial_time_before_final_time?
		errors.add('Horário Inicial', 'deve ser menor que o Horário Final') unless self.initial_time < self.final_time
	end

	def is_clone?
		if self.changed?
			window = WindowRequest::where(initial_time: self.initial_time).where(final_time: self.final_time).first
			errors.add('Já existe', 'Janela de Entrega com esses horários') unless window.nil?
		end
	end
end
