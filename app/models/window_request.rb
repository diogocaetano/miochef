class WindowRequest < ActiveRecord::Base
	validates :initial_time, presence: true
	validates :final_time, presence: true
end
