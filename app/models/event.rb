class Event < ApplicationRecord
    mount_uploader :event_avatar, AvatarUploader
    mount_uploader :event_box_office, SpreadsheetUploader
    belongs_to :user 
    # <!--===================-->
    # <!--to add nested scaffold-->
    has_many :seats , dependent: :destroy
    has_many :guests , dependent: :destroy
    has_many :email_services, dependent: :destroy
    # <!--===================-->
    def calculate_seating_summary(event_id)
        seating_summary = []
    
        Seat.where(event_id: event_id).each do |seat|
          guests_in_category = Guest.where(event_id: event_id, category: seat.category)
          committed_seats = guests_in_category.sum(:commited_seats)
          allocated_seats = guests_in_category.sum(:alloted_seats)
          total_seats = seat.total_count
    
          seating_summary << {
            category: seat.category,
            guests_count: guests_in_category.count,
            committed_seats: committed_seats,
            allocated_seats: allocated_seats,
            total_seats: total_seats
          }
        end
    
        seating_summary
      end
end
