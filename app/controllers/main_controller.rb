class MainController < ApplicationController

    layout 'application'

  def index
    #limitiamo slo i primi 5 eventi da mostrare in homepage
    @eventi = Evento.order(id: :desc).limit(5)
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

  def eventi
    @eventi = Evento.order(id: :desc)
    render '/eventi'
  end

  def piani
    @piani = Piano.order(nome: :asc)
    render '/piani'
  end

  def dettaglioPiano
    @piano = Piano.find(params[:id])
    render '/dettaglioPiano'
  end

  def insegnanti
    @insegnanti = Insegnante.order(nome: :asc)
    render '/insegnanti'
  end

  def dettaglioInsegnante
    @insegnante = Insegnante.find(params[:id])
    render '/dettaglioInsegnante'
  end


end
