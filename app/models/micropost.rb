class Micropost < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true

	validates :title, presence: true
	validates :key, presence: true
	validates :category, presence: true
	validates :whole_price, presence: true
	validates :shipping_cost, presence: true
	validates :short_desc, presence: true
	validates :desc, presence: true
	validates :rep_short_desc, presence: true
	validates :rep_desc, presence: true
end
