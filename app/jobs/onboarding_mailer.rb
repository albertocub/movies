class OnboardingMailer < ApplicationJob

queue_as :default
	def perform(user=nil)
		unless user.is_a?(Array)
			if user.is_a?(User)
				user = [user]
			else
				#user = User.where('canceled IS NO TRUE and active is TRUE')
				user = User.all
			end			
		end
		user.each do |user|
			begin
				#if user.created_At < 1.minute.ago
					if user.maketing_mailer.blank?
						user.marketing_mailer = 1
						user.marketing_mailer_date = Date.today
						user.save
						UserNotifierMailer.send_signup_email(user).deliver_now  
					#Despues de 10 minutos	
					elsif user.marketing_mailer == 1 && user.marketing_mailer_date < 10.minutes.ago		 
						user.marketing_mailer = 2
						user.marketing_mailer_date = Date.today
						user.save
						UserNotifierMailer.send_signup_email_second(user).deliver_now 
					#Despues de 2 horas	
					elsif user.marketing_mailer == 2 && user.marketing_mailer_date > 2.hours.ago	 
						user.marketing_mailer = 3
						user.marketing_mailer_date = Date.today
						user.save
						UserNotifierMailer.send_signup_email_third(user).deliver_now 
					end
				#end
				rescue => e
					message = "user-#{user.id} \n\t#{e.message}\n\n \t#{e.backtrace.join("\n\t")}"
					LogManager.create(:user=>user.id,:exception_message=>message,:tag=>"MailerError")
				end
			end
		end
end #end class
