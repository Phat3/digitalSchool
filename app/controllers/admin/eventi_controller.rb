class Admin::EventiController < ApplicationController

    layout "adminlayout"

    def index
        @eventi = Evento.all
        render 'admin/eventi/eventi'
    end

    def eventiAdd
        render 'admin/eventi/eventiAdd'
    end

    def aggiungi

        @evento = Evento.new()
        @evento.nome = params[:nome]
        @evento.data = params[:data]
        @evento.descrizione = params[:descrizione]
        @evento.save()

        redirect_to '/admin/eventi'
    end

    def elimina

        @evento = Evento.find(params[:id])
        @evento.destroy
        render :nothing => true

    end

    skip_before_action :verify_authenticity_token
    def getInfo

        @evento = Evento.find(params[:id])
        render :json => @evento

    end

    def edit
        @evento = Evento.find(params[:id])
        render 'admin/eventi/eventiEdit'
    end

    def aggiorna
        @evento = Evento.find(params[:id])
        @evento.nome = params[:nome]
        @evento.descrizione = params[:descrizione]
        @evento.data = params[:data]
        @evento.save()
        redirect_to '/admin/eventi'
    end

end
