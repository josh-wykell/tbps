ActiveAdmin.register Speaker do

 permit_params :name, :biography, :title, :description, :image, :url, :date
end
