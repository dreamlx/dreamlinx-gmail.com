ActiveAdmin.register Cctv do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :ip, :title, :username, :password
  #
  # or
  #
  # permit_params do
  #   permitted = [:ip, :title, :username, :password]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input  :ip
      f.input :title
      f.input :username, hint: 'admin', input_html: {value: 'admin'}
      f.input :password, hint: 'admin', value: 'admin'
    end
    f.actions
  end
end
