class Micropost < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true

	validates :title, presence: true
	validates :category, presence: true
	validates :short_desc, presence: true
	validates :desc, presence: true
	validates :rep_short_desc, presence: true
	validates :rep_desc, presence: true
	validates :goods_seq, presence: true, numericality: { only_integer: true }
	validates :maker, presence: true
	validates :pic_url, presence: true
	
end
