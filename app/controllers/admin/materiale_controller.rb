class Admin::MaterialeController < ApplicationController

    layout "adminlayout"

    def index
        @corso = Corso.find(params[:id])
        @materiale = Materiale.where(:corso_id => params[:id])
        render 'admin/corsi/materiale'
    end

    skip_before_action :verify_authenticity_token
    def upload
        @materiale = Materiale.new()
        @materiale.nome = params[:nome]
        @materiale.tipo = params[:tipo]
        @materiale.corso_id = params[:corso]

        params[:files]['file'].each do |i|
            ext = File.extname(i.original_filename)
            @materiale.file = SecureRandom.uuid + ext
            #passiamo anche il nome cosi da evitare problemi in fase di cancellazione(nomiunivoci)
            Materiale.savefile(i, @materiale.file)
        end

        @materiale.save()

        render :nothing => true
    end

end
