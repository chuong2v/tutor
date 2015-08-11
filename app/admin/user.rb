ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :username, :email, :phone, :age, :address, :job, :gender_id, :role_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  
  index do  
    column :username 
    column :email
    column :phone
    column :age
    column :address 
    column :job
    column :gender_id
    column :role_id
  end

end
