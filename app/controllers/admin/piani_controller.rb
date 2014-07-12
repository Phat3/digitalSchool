class Admin::PianiController < ApplicationController

    layout "adminlayout"

    def piani
        render 'admin/piani/piani'
    end

    def pianiAdd
        render 'admin/piani/pianiAdd'
    end

    #adios sicurezza
    skip_before_action :verify_authenticity_token
    def aggiungiPiano

        #var_dump di rails
        puts YAML::dump(params)
        #non vogiamo fare il render di niente
        render :nothing => true

    end

end
