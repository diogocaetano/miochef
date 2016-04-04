module ApplicationHelper

	def version
		file = File.read("VERSION") + Rails.env[0, 3]
	end

end
