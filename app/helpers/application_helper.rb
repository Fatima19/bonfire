module ApplicationHelper
	def full_title(page_title)
		base_title = "Bonfire"
		home_title = "Welcome to Bonfire"
		if page_title.empty?
			home_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
