class Admin::AdminController < ApplicationController

    layout "adminlayout"

    def index
        render 'admin/index'
    end

    def piani
        render 'admin/piani/piani'
    end

    def pianiAdd
        render 'admin/piani/pianiAdd'
    end

end
