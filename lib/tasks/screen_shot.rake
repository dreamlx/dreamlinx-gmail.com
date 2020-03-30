task :screen_shot => :environment do

	require 'net/http'
	require 'thread'

	mutex = Mutex.new

    # Pelco.all.each do |pel|
    #  	thr = Thread.new do
    #  		mutex.synchronize do
    #  			uri = URI("http://#{pel.ip}/api/jpeg")
    #  			Net::HTTP.start(uri.host, uri.port) do |http|
    #  				request = Net::HTTP::Get.new(uri)
    #  				request.basic_auth pel.name, pel.password
    #  				http.request request do |response|
    #  					t = Time.now.to_s.delete("-").delete(" ").delete(":").split("+")[0]
    #  					open "#{ENV['pic_store_path']}/#{pel.name}_screen_shot/image_#{pel.name}_#{t}.png", 'w' do |io|
    #  						response.read_body do |chunk|
    #  							io.write chunk
    #  						end
    #  					end
    #  				end

    #  			end
	     		
    #  		end
    #  	end
    #  	thr.join 
    #  	sleep 1  
	# end
	
	
end



			    