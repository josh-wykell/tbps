ActiveAdmin.register Film do

 permit_params :title, :date, :time, :first_speaker, :second_speaker, :synopsis
end
