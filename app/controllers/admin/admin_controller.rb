class Admin::AdminController < ApplicationController

    layout "adminlayout"

    def index
        render 'admin/index'
    end

end
