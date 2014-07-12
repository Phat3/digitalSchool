class Insegnante < ActiveRecord::Base

    def self.savefile(upload, nome)
    name =  nome
    directory = "public/data/insegnanti"
    #nel caso non esista la creiamo
    Dir.mkdir(directory) unless File.exists?(directory)

    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
  end


end
