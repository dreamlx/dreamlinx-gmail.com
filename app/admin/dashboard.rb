ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small "修改截图周期： $crontab -e"
        small "*/1 * * * * /home/ubuntu/bin/start_up.sh >> /tmp/time.txt  => */1 意思是1分钟一次， 改为5分钟就是 */5"

        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
  
    columns do
      # column do
      #   panel "Recent Posts" do
      #     ul do
      #       Post.recent(5).map do |post|
      #         li link_to(post.title, admin_post_path(post))
      #       end
      #     end
      #   end
      # end


      
      column do
        
        panel I18n.t("active_admin.dashboard_welcome.Info") do
          
          link_to image_tag(image_url('123.jpg')), I18n.t("active_admin.dashboard_welcome.call_to_action")
        end
      end
    end
  end # content
end
