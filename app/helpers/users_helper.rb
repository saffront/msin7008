module UsersHelper


	def job_title_icon
		if @user.profile.job_title == "Developer"
			"<i class='glyphicon glyphicon-flash'></i>".html_safe
		elsif @user.profile.job_title =="Marketer"
			"<i class='glyphicon glyphicon-send'></i>".html_safe
		elsif @user.profile.job_title =="Designer"
			"<i class='glyphicon glyphicon-apple'></i>".html_safe			
		end
	end
end
