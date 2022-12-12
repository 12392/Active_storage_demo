class Pin < ApplicationRecord
		has_one_attached :image
		has_one_attached :clip
		has_many_attached :pictures

		validate :image_type
		validate :clip_type
		validate :picture_type

		private

		def image_type
				if !image.content_type.in?(%('image/jpeg image/png'))
						errors.add(:image, 'needs to jpeg or png')
				end
		end

		def clip_type
				if clip.attached?
						if !clip.content_type.in?(%('clip/mp4'))
								errors.add(:clip, 'needs to mp4')
						end
				end
		end

		def picture_type
				pictures.each do |image|
						if !image.content_type.in?(%('image/jpeg image/png'))
								errors.add(:pictures, 'needs to jpeg or png')
						end
				end
		end


end
