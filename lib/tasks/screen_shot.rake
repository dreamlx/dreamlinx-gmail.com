desc 'get jpg from cctv'
task :screen_shot => :environment do

	require 'net/http'
	require 'thread'
	#require 'open-uri'

	mutex = Mutex.new
	puts 'start get jpg from cctv'

    Cctv.all.each do |pel|
     	thr = Thread.new do
     		mutex.synchronize do
				 uri = URI("http://#{pel.ip}/api/jpeg")
				 #uri = URI("http://127.0.0.1:3000/assets/123-e883c6b39daa11278fb117a0c90bedadca52eae9954e3bc3b80b427d2008c512.jpg")
				 begin

					Net::HTTP.start(uri.host, uri.port) do |http|
						request = Net::HTTP::Get.new(uri)
						request.basic_auth pel.username, pel.password
						http.request request do |response|
							if response.code == '200' then 
								t = Time.now.to_s.delete("-").delete(" ").delete(":").split("+")[0]
								open "/home/ubuntu/images/image_#{pel.id}_#{t}.jpg", 'w' do |io|
									response.read_body do |chunk|
										io.write chunk
									end
								end
							else
								puts "#{pel.id}: request bad, username: #{pel.username}"
							end
						end
					end
				 
				rescue StandardError => e
					puts "#{e.inspect}"
				end
     		end
     	end
     	thr.join 
     	sleep 1  
	end
end



			    