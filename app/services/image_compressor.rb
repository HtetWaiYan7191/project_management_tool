# frozen_string_literal: true

class ImageCompressor
  require 'image_processing/mini_magick'
  def self.compress(image_path, quality: 70)
    ImageProcessing::MiniMagick
      .source(image_path)
      .resize_to_limit(500, 500)
      .quality(quality)
      .convert('jpg')
      .call(destination: "tmp/compressed_#{Time.now.to_i}.jpg")
  end
end
