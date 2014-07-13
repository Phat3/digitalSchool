class MainController < ApplicationController

    layout 'application'

  def index
    render '/home'
  end

  def history
    render '/history'
  end

  def principles
    render '/principles'
  end

  def rules
    render '/rules'
  end
  def admission
    render '/admission'
  end
  def support
    render '/support'
  end
  def successi
    render '/successi'
  end
  def ufficio
    render '/ufficio_scuola'
  end
  def strutture
    render '/strutture'
  end
end
