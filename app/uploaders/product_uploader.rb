#Clase creada al ejecutar rails g uploader Product
class ProductUploader < CarrierWave::Uploader::Base
  #Lugar donde se van a almacenar las imágenes
  storage :file

  #Directorio donde se van a guardar las imágenes
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #Extensión de los archivos que sí se pueden subir
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
