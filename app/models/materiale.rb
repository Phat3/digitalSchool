class Materiale < ActiveRecord::Base

    def self.savefile(upload, nome)
    name =  nome
    mainDirectory = "public/data"
    directory = "public/data/materale"
    #nel caso non esista la creiamo
    Dir.mkdir(mainDirectory) unless File.exists?(mainDirectory)
    Dir.mkdir(directory) unless File.exists?(directory)

    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

end
