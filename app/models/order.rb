class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items  # :dependent => :destroy #on cascade delete for dashboard

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end
