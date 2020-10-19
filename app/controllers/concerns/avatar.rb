# frozen_string_literal: true

module Avatar
  extend ActiveSupport::Concern

  def get_avatar(file_name)
    unless image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', file_name)),\
                   filename: 'avatar.jpeg', content_type: 'image/jpeg')
    end
  end
end
