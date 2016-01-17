ActiveAdmin.register SaleItem, as: "Sold Tickets" do

  permit_params :cart_id, :speaking_event_id, :quantity, :unit_price

    index do
      column "Buyer", :sortable => :cart do |sale_item|
        sale_item.cart.buyer_name
      end
      column "Event", :sortable => :speaking_event do |sale_item|
        sale_item.speaking_event.speaker.name
      end
      column "Event_ID", :speaking_event_id
      column "Time", :sortable => :speaking_event do |sale_item|
        sale_item.speaking_event.time.strftime("%I:%M%P")
      end
      column "Date", :sortable => :speaking_event do |sale_item|
        sale_item.speaking_event.date.strftime("%m/%d/%y")
      end
      column :quantity
      actions
    end

    filter :speaking_event, as: :select, collection: proc {SpeakingEvent.all.map{ |event| [event.id]}}
end
