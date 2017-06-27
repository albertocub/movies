 
desc "Bienvenido"

namespace :firstjob do
	
	 
	task :hello do
	  %{echo "World!"}   # example task
	end 
	
	task :task_sendmailer1 => :environment do
		#if Time.now.day
			# NameJob.perform_later
			#UserNotifierMailer.send_signup_email(user).deliver_now		#perform_now
			OnboardingMailer.perform_now
		#end
	end

	 

end