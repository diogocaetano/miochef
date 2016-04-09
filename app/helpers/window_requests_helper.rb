module WindowRequestsHelper
	def get_initial_timepicker_value window_request
		if window_request.initial_time.nil?
			'00:00'
		else
			window_request.initial_time.to_s(:time)
		end
	end

	def get_final_timepicker_value window_request
		if window_request.final_time.nil?
			'00:00'
		else
			window_request.final_time.to_s(:time)
		end
	end
end
