desc "Bienvenido" 
namespace :firstjob do 
	task :hello do
	  %{echo "World!"}   # example task
	end  
	task :task_sendmailer1 => :environment do 
			# if Time.now.wday.between?(1,5)  # De Lunes a Viernes 1 a 5
			# if Time.now.monday?  # Solo los Lunes
			# if Time.now.wday?    # Si es un dia laboral de Lunes a Viernes
			puts "Enviando emails ... "
			OnboardingMailer.perform_now
			puts " Hecho ! "
		#end
	end 
end