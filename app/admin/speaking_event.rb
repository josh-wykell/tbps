ActiveAdmin.register SpeakingEvent do
  permit_params :date, :time, :street_address, :city, :zipcode, :description, :regular_price, :speaker_id, :member_price

  index do 
    column :speaker
    column :id 
    column :date, :sortable => :date do |speaking_event|
      speaking_event.date.strftime("%m/%d/%y")
    end
    column :time do |speaking_event|
      speaking_event.time.strftime("%I:%M%P")
    end
    column :regular_price do |speaking_event|
      number_to_currency(speaking_event.regular_price)
    end
    column :member_price do |speaking_event|
      number_to_currency(speaking_event.member_price)
    end
    actions
  end
end
