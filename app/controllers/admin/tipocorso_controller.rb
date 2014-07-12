class Admin::TipocorsoController < ApplicationController

    layout "adminlayout"

    def index
        @tipi = TipoCorso.all
        render 'admin/tipiCorsi/tipiCorsi'
    end


    skip_before_action :verify_authenticity_token
    def aggiungiTipo

        @tipo = TipoCorso.new()
        @tipo.nome = params['nome']
        @tipo.save
        #ritorniamolo in json
        render :json => @tipo

    end

     skip_before_action :verify_authenticity_token
    def eliminaTipo

        @tipo = TipoCorso.find(params[:id])
        @tipo.destroy

        render :nothing => true

    end


end
