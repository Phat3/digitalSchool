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

        params[:immagine]['image'].each do |i|
            ext = File.extname(i.original_filename)
            @insegnante.foto = SecureRandom.uuid + ext
            #passiamo anche il nome cosi da evitare problemi in fase di cancellazione(nomiunivoci)
            Insegnante.savefile(i, @insegnante.foto)
        end

         params[:pdfs]['pdf'].each do |i|
            ext = File.extname(i.original_filename)
            @insegnante.cv = SecureRandom.uuid + ext
            #passiamo anche il nome cosi da evitare problemi in fase di cancellazione(nomiunivoci)
            Insegnante.savefile(i, @insegnante.cv)
        end

        @insegnante.save()

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
