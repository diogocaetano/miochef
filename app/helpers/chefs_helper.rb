module ChefsHelper
	
	def self.chef_have_this_badge?(badge, chef)
		chef.badges.each do |b|
			return 'checked' if badge.id == b.id
		end	
	end
end
