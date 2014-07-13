class Admin::ClassiController < ApplicationController

    layout "adminlayout"

    def index
        @classi = Classe.all
        @piani = Piano.all
        render 'admin/classi/classi'
    end

end
