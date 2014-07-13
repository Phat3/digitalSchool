class Admin::PianiController < ApplicationController

    layout "adminlayout"

    def piani
        @piani = Piano.all
        render 'admin/piani/piani'
    end

    def pianiAdd
        render 'admin/piani/pianiAdd'
    end

    #adios sicurezza
    skip_before_action :verify_authenticity_token
    def aggiungiPiano

        @piano = Piano.new()
        @piano.nome = params['nome']
        @piano.descrizione = params['descrizione']
        @piano.save
        #var_dump di rails
        puts YAML::dump(params['nome'])
        #non vogiamo fare il render di niente
        render :nothing => true

    end

    skip_before_action :verify_authenticity_token
    def eliminaPiano

        @piano = Piano.find(params[:id])

        @corsi = Corso.where(:piano_id => @piano.id)

        #delete a cascata di corsi e classi quando si cancella un piano formativo
        @corsi.each do |des|
            des.destroy
        end

        @classi = Classe.where(:piano_id => @piano.id)

        @classi.each do |des|
            des.destroy
        end

        @piano.destroy
        #non vogiamo fare il render di niente
        render :nothing => true

    end

end
