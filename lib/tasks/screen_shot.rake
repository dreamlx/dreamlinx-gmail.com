desc 'get jpg from cctv'
task :screen_shot => :environment do

	require 'net/http'
	require 'thread'

	mutex = Mutex.new


    Cctv.all.each do |pel|
     	thr = Thread.new do
     		mutex.synchronize do
     			uri = URI("http://#{pel.ip}/api/jpeg")
     			Net::HTTP.start(uri.host, uri.port) do |http|
     				request = Net::HTTP::Get.new(uri)
     				request.basic_auth pel.username, pel.password
					 http.request request do |response|
						if response.code == '200' then 
     						t = Time.now.to_s.delete("-").delete(" ").delete(":").split("+")[0]
     						open "#{ENV['PELCO_PIC_PATH']}/image_#{pel.id}_#{t}.jpg", 'w' do |io|
     							response.read_body do |chunk|
     								io.write chunk
     							end
							end
						else
							puts "#{pel.id}: request bad, username: #{pel.username}"
						end
     				end

     			end
	     		
     		end
     	end
     	thr.join 
     	sleep 1  
	end
end



			    