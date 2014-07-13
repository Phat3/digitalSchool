class Admin::InsegnantiController < ApplicationController

    layout "adminlayout"

    def index
        @insegnanti = Insegnante.all
        render 'admin/insegnanti/insegnanti'
    end

    def insegnantiAdd
        render 'admin/insegnanti/insegnantiAdd'
    end

    skip_before_action :verify_authenticity_token
    def aggiungiInsegnante
        @insegnante = Insegnante.new()
        @insegnante.nome = params[:nome]
        @insegnante.bio = params[:descrizione]


         if(params.include?(:immagine))
            params[:immagine]['image'].each do |i|
                ext = File.extname(i.original_filename)
                @insegnante.foto = SecureRandom.uuid + ext
                #passiamo anche il nome cosi da evitare problemi in fase di cancellazione(nomiunivoci)
                Insegnante.savefile(i, @insegnante.foto)
            end
        end

        if(params.include?(:pdfs))
             params[:pdfs]['pdf'].each do |i|
                ext = File.extname(i.original_filename)
                @insegnante.cv = SecureRandom.uuid + ext
                #passiamo anche il nome cosi da evitare problemi in fase di cancellazione(nomiunivoci)
                Insegnante.savefile(i, @insegnante.cv)
            end
        end

        if(params.include?(:immagine) and params.include?(:pdfs))
            @insegnante.save()
        end

        redirect_to '/admin/insegnanti'

    end

    skip_before_action :verify_authenticity_token
    def eliminaInsegnante

        @insegnante = Insegnante.find(params[:id])
        name = @insegnante.foto

        directory = "public/data/insegnanti"
        # create the file path
        path = File.join(directory, name)

        File.delete(path) if File.exist?(path)

        name = @insegnante.cv
        path = File.join(directory, name)

        File.delete(path) if File.exist?(path)

        @corsi = Corso.where(:insegnante_id => @insegnante.id)

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

        @insegnante.destroy
        render :nothing => true
    end


    def getInfo
        @insegnante = Insegnante.find(params[:id])
        render :json => @insegnante
    end


    def edit
        @insegnante = Insegnante.find(params[:id])
        render 'admin/insegnanti/insegnantiEdit'
    end

    def aggiorna
        @insegnante = Insegnante.find(params[:id])
        @insegnante.nome = params[:nome]
        @insegnante.bio = params[:descrizione]

        if(params.include?(:immagine))
                params[:immagine]['image'].each do |i|
                ext = File.extname(i.original_filename)
                @insegnante.foto = SecureRandom.uuid + ext
                #passiamo anche il nome cosi da evitare problemi in fase di cancellazione(nomiunivoci)
                Insegnante.savefile(i, @insegnante.foto)
            end
        end

        if(params.include?(:pdfs))
                params[:pdfs]['pdf'].each do |i|
                ext = File.extname(i.original_filename)
                @insegnante.cv = SecureRandom.uuid + ext
                #passiamo anche il nome cosi da evitare problemi in fase di cancellazione(nomiunivoci)
                Insegnante.savefile(i, @insegnante.cv)
            end
        end

        @insegnante.save()
        redirect_to '/admin/insegnanti'

    end
end
