class MainController < ApplicationController

    layout 'application'

  def index
    #limitiamo slo i primi 5 eventi da mostrare in homepage
    @piani = Piano.order(nome: :asc)
    @eventi = Evento.order(id: :desc).limit(5)
    render '/home'
  end

  def history
    @piani = Piano.order(nome: :asc)
    render '/history'
  end

  def principles
    @piani = Piano.order(nome: :asc)
    render '/principles'
  end

  def rules
    @piani = Piano.order(nome: :asc)
    render '/rules'
  end

  def admission
    @piani = Piano.order(nome: :asc)
    render '/admission'
  end

  def support
    @piani = Piano.order(nome: :asc)
    render '/support'
  end

  def successi
    @piani = Piano.order(nome: :asc)
    render '/successi'
  end

  def ufficio
    @piani = Piano.order(nome: :asc)
    render '/ufficio_scuola'
  end

  def strutture
    @piani = Piano.order(nome: :asc)
    render '/strutture'
  end

  def eventi
    @piani = Piano.order(nome: :asc)
    @eventi = Evento.order(id: :desc)
    render '/eventi'
  end

  def piani
    @piani = Piano.order(nome: :asc)
    render '/piani'
  end

  def dettaglioPiano
    @piani = Piano.order(nome: :asc)
    @piano = Piano.find(params[:id])
    render '/dettaglioPiano'
  end

  def insegnanti
    @piani = Piano.order(nome: :asc)
    @insegnanti = Insegnante.order(nome: :asc)
    render '/insegnanti'
  end

  def dettaglioInsegnante
    @piani = Piano.order(nome: :asc)
    @insegnante = Insegnante.find(params[:id])
    @corsi = Corso.where(:insegnante_id => params[:id])
    render '/dettaglioInsegnante'
  end


  def classi
    if(params[:id] == 'all')
      @all = 'true'
      @piani = Piano.order(nome: :asc)
      @classi = Classe.order(nome: :asc)
    else
      @all = 'false'
      @piani = Piano.order(nome: :asc)
      @classi = Classe.where(:piano_id => params[:id])
    end
    render '/classi'
  end

  def dettaglioClasse
    @piani = Piano.order(nome: :asc)
    @classe = Classe.find(params[:id])
    @corsi = Corso.where(:classe_id => params[:id])
    render '/dettaglioClasse'
  end

  def genitori
     @piani = Piano.order(nome: :asc)
    render '/rappr_genitori'
  end

    def corsi
    if(params[:id] == 'all')
      @all = 'true'
      @piani = Piano.order(nome: :asc)
      @corsi = Corso.order(nome: :asc)
    else
      @all = 'false'
      @piani = Piano.order(nome: :asc)
      @corsi = Corso.where(:piano_id => params[:id])
    end
    render '/corsi'
  end


  def dettaglioCorso
    @piani = Piano.order(nome: :asc)
    @corso = Corso.find(params[:id])
    render '/dettaglioCorso'
  end

  def materiale
    @piani = Piano.order(nome: :asc)
    @corso = Corso.find(params[:id])
    @tipi = Materiale.select(:tipo).where(:corso_id => params[:id]).distinct
    @materiale = Materiale.where(:corso_id => params[:id])
    render '/materiale'
  end


  end
