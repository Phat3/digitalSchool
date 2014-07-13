class Admin::ClassiController < ApplicationController

    layout "adminlayout"

    def index
        @classi = Classe.all
        @piani = Piano.all
        render 'admin/classi/classi'
    end

    skip_before_action :verify_authenticity_token
    def aggiungi

        @classe = Classe.new()
        @classe.nome = params[:nome]
        @classe.piano_id = params[:piano]

        if(params.include?(:images))
            params[:images]['image'].each do |i|
                ext = File.extname(i.original_filename)
                @classe.orario = SecureRandom.uuid + ext
                #passiamo anche il nome cosi da evitare problemi in fase di cancellazione(nomiunivoci)
                Classe.savefile(i, @classe.orario)
            end
        end

        if(params.include?(:images))
            @classe.save()
        end

        render :json => @classe
    end

    def getInfo
        @classe = Classe.find(params[:id])
        render :json => @classe
    end

    skip_before_action :verify_authenticity_token
    def elimina

        @classe = Classe.find(params[:id])
        name = @classe.orario

        directory = "public/data/classi"
        # create the file path
        path = File.join(directory, name)

        File.delete(path) if File.exist?(path)

        @corsi = Corso.where(:classe_id => @classe.id)

        #delete a cascata di corsi e classi quando si cancella un piano formativo
        @corsi.each do |des|
            #cancello tutti i materiali associati al corso
                @materiali = Materiale.where(:corso_id => des.id)
                @materiali.each do |val|
                    nameVal = val.file
                    directoryVal = "public/data/materale"
                    # create the file path
                    path = File.join(directoryVal, nameVal)
                    File.delete(path) if File.exist?(path)
                    val.destroy
                    end
            des.destroy
        end

        @classe.destroy

        render :nothing => true
    end

end
