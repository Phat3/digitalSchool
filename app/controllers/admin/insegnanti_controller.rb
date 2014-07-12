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

        @insegnanti = Insegnante.all
        render 'admin/insegnanti/insegnanti'

    end

    skip_before_action :verify_authenticity_token
    def eliminaTipo
        @tipo = TipoCorso.find(params[:id])
        @tipo.destroy
        render :nothing => true
    end
end
