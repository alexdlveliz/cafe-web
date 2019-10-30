#Clase para poder subir imágenes al servidor de Amazon (AWS)
class EventUploader < CarrierWave::Uploader::Base
  storage :aws
  
  #Dirección de donde van a estar almacenadas las imaǵenes
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #Extensión de los archivos que sí se pueden subir
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
