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
            @insegnante.foto = i.original_filename
            Insegnante.savefile(i)
        end

         params[:pdfs]['pdf'].each do |i|
            @insegnante.cv = i.original_filename
            Insegnante.savefile(i)
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
end
