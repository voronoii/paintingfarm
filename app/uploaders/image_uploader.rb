class ImageUploader < CarrierWave::Uploader::Base

  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  def store_dir
    #"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "markets/artist_#{model.artist.id}/m_#{model.id}"
  end

  #used in /markets/show/:id
  version :large do
    resize_to_limit(500, nil)
  end  
  
  #used in /markets
  version :medium do
    resize_to_limit(300, nil)
  end 
  
  version :small do
    process :crop
    resize_to_fill(100, 100)
  end 
  
  #used in / and /artists
  #정사각형
  version :thumb do
    process :crop
    resize_to_fill(300, 300)
  end

  #썸네일 crop부분
  def crop
    if model.crop_x.present?
      resize_to_limit(600, 600)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end
  
  #파일명
  def filename
    "artist#{model.artist.id}_#{secure_token}.#{file.extension}" if original_filename
  end   
  
  #유니크한 파일명 code
  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end  

end
