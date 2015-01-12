class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :status_valid?
  validate :overlapping_approved_requests
  after_initialize :set_status

  belongs_to :cat

  belongs_to(
    :requester,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  def set_status
    self.status ||= "PENDING"
  end

  def approve!
    requests_to_update = {}
    overlapping_pending_requests.each do |request|
      requests_to_update[request.id] = {"status" => 'DENIED'}
    end
    requests_to_update[self.id] = {"status" => 'APPROVED'}
    self.class.update(requests_to_update.keys, requests_to_update.values)
  end

  def deny!
    self.update_attributes(status: 'DENIED')
  end

  private

  def status_valid?
    unless ["APPROVED", "DENIED", "PENDING"].include?(status)
      errors[:status] << "must be 'APPROVED', 'DENIED', or 'PENDING'"
    end
  end

  def overlapping_pending_requests
    overlapping_requests.select { |request| request.status == "PENDING" }
  end

  def overlapping_approved_requests
    # all_rental_req = self.class.where("cat_id = ? AND id != ? AND status = 'APPROVED'", self.cat_id, self.id)
    # if all_rental_req.any? { |req| overlapping_requests(req) }
    #   errors[:base] << 'start and end dates overlap with another approved request'
    # end
    overlapping_request_array = overlapping_requests.select { |request| request.status == "APPROVED" }
    overlapping_request_names = overlapping_request_array.collect { |request| "start date of #{request.start_date} and end date of #{request.end_date}"}
    unless overlapping_request_array.empty?
      errors[:base] << "Start and end dates overlap with another approved request (currently overlapping with rental for #{overlapping_request_names.join(", ")})"
    end
  end

  def overlapping_requests
    # (req.start_date..req.end_date).cover?(self.start_date) ||  (req.start_date..req.end_date).cover?(self.end_date)
    all_rental_req = self.class.where("cat_id = ? AND (? IS NULL OR id != ?)", self.cat_id, self.id, self.id)
    overlapping_dates = []

    all_rental_req.each do |req| # should have used sql query for this part
      if self.class.overlapping_dates(req, self) || self.class.overlapping_dates(self, req)
        overlapping_dates << req
      end
    end

    overlapping_dates
  end

  def self.overlapping_dates(req1, req2)
    (req1.start_date..req1.end_date).cover?(req2.start_date) ||  (req1.start_date..req1.end_date).cover?(req2.end_date)
  end

end
