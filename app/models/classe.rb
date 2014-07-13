class Classe < ActiveRecord::Base

        def self.getPiano(classe)
            @piano = Piano.find(classe.piano_id)
        end

        def self.savefile(upload, nome)
            name =  nome
            directory = "public/data/classi"
            #nel caso non esista la creiamo
            Dir.mkdir(directory) unless File.exists?(directory)

            # create the file path
            path = File.join(directory, name)
            # write the file
            File.open(path, "wb") { |f| f.write(upload.read) }
          end
end
