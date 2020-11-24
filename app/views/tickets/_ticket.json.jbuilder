json.extract! ticket, :id, :space_id, :registration_number, :paid_from, :paid_to, :total_cost, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
