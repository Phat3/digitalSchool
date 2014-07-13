class Admin::CorsiController < ApplicationController

    layout "adminlayout"

    def index
        @corsi = Corso.all
        render 'admin/corsi/corsi'
    end

     def corsiAdd
        @insegnanti = Insegnante.all
        @piani = Piano.all
        @classi = Classe.all
        render 'admin/corsi/corsiAdd'
    end

    def aggiungi
        @corso = Corso.new()
        @corso.nome = params[:nome]
        @corso.descrizione = params[:descrizione]
        @corso.insegnante_id = params[:insegnante]
        @corso.classe_id = params[:classe]
        @corso.piano_id = params[:piano]
        @corso.save()
        redirect_to '/admin/corsi'
    end

    skip_before_action :verify_authenticity_token
    def getInfo
        @corso = Corso.find(params[:id])
        @insegnante = Insegnante.find(@corso.insegnante_id)
        @piano = Piano.find(@corso.piano_id)
        array = { 'corso' => @corso,  'insegnante' => @insegnante, 'piano' => @piano}
        render :json => array
    end

    def edit
        @corso = Corso.find(params[:id])
        @insegnanti = Insegnante.all
        @piani = Piano.all
        @classi = Classe.all
        render 'admin/corsi/corsiEdit'
    end

    def aggiorna
        @corso = Corso.find(params[:id])
        @corso.nome = params[:nome]
        @corso.descrizione = params[:descrizione]
        @corso.insegnante_id = params[:insegnante]
        @corso.classe_id = params[:classe]
        @corso.piano_id = params[:piano]

        @corso.save()
        redirect_to '/admin/corsi'

    end

    def getClassi
        @classi = Classe.where(:piano_id => params[:id])
        render :json => @classi
    end

    skip_before_action :verify_authenticity_token
    def elimina
        @corso = Corso.find(params[:id])

        directory = "public/data/materiale"
        #cancello tutti i materiali associati al corso
        @materiali = Materiale.where(:corso_id => @corso.id)
        @materiali.each do |des|
            name = des.file
            directory = "public/data/materale"
            # create the file path
            path = File.join(directory, name)
            File.delete(path) if File.exist?(path)
            des.destroy
        end
        @corso.destroy
        render :nothing => true
    end


end
