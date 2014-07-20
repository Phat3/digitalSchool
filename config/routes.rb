Rails.application.routes.draw do

  root 'main#index'

  ###### ROUTES ADMIN ######

  get '/admin/index', to: 'admin/admin#index'

  get '/admin/piani', to: 'admin/piani#piani'

  get '/admin/pianiAdd', to: 'admin/piani#pianiAdd'

  post '/admin/aggiungiPiano', to: 'admin/piani#aggiungiPiano'

  post '/admin/eliminaPiano', to: 'admin/piani#eliminaPiano'

  post '/admin/getInfoPiani', to: 'admin/piani#getInfo'

  get '/admin/pianiEdit/:id', to: 'admin/piani#edit'

  post '/admin/aggiornaPiano/:id', to: 'admin/piani#aggiorna'

  get '/admin/corsi', to: 'admin/corsi#index'

  get '/admin/corsiAdd', to: 'admin/corsi#corsiAdd'

   get '/admin/corsiEdit/:id', to: 'admin/corsi#edit'

  post '/admin/aggiungiCorso', to: 'admin/corsi#aggiungi'

  post '/admin/getInfoCorsi', to: 'admin/corsi#getInfo'

  post '/admin/getClassiByPiano', to: 'admin/corsi#getClassi'

  post '/admin/eliminaCorso', to: 'admin/corsi#elimina'

  post '/admin/aggiornaCorso/:id', to: 'admin/corsi#aggiorna'

  get '/admin/insegnanti', to: 'admin/insegnanti#index'

  get '/admin/insegnantiAdd', to: 'admin/insegnanti#insegnantiAdd'

  post '/admin/aggiungiInsegnante', to: 'admin/insegnanti#aggiungiInsegnante'

  post '/admin/eliminaInsegnante', to: 'admin/insegnanti#eliminaInsegnante'

  post '/admin/getInfoInsegnante', to: 'admin/insegnanti#getInfo'

  get '/admin/insegnantiEdit/:id', to: 'admin/insegnanti#edit'

  post '/admin/aggiornaInsegnante/:id', to: 'admin/insegnanti#aggiorna'

  get '/admin/materiale/:id', to: 'admin/materiale#index'

  post '/admin/materiale/upload', to: 'admin/materiale#upload'

  post '/admin/eliminaMateriale', to: 'admin/materiale#eliminaMateriale'

  get '/admin/classi', to: 'admin/classi#index'

  post '/admin/classi/aggiungi', to: 'admin/classi#aggiungi'

  post '/admin/getInfoClassi', to: 'admin/classi#getInfo'

  post '/admin/eliminaClasse', to: 'admin/classi#elimina'

  get '/admin/eventi', to: 'admin/eventi#index'

  get '/admin/eventiAdd', to: 'admin/eventi#eventiAdd'

  post '/admin/aggiungiEvento', to: 'admin/eventi#aggiungi'

  post '/admin/eliminaEvento', to: 'admin/eventi#elimina'

  post '/admin/getInfoEvento', to: 'admin/eventi#getInfo'

  get '/admin/eventiEdit/:id', to: 'admin/eventi#edit'

  post '/admin/aggiornaEvento/:id', to: 'admin/eventi#aggiorna'

  ###### ROUTES UTENTE ######

  get '/history', to: 'main#history'

  get '/principles', to: 'main#principles'

  get '/rules', to: 'main#rules'

  get '/admission', to: 'main#admission'

  get '/support', to: 'main#support'

  get '/successi', to: 'main#successi'

  get '/ufficio_scuola', to: 'main#ufficio'

  get '/strutture', to: 'main#strutture'

  get '/eventi', to: 'main#eventi'

  get '/pianiFormativi', to: 'main#piani'

  get '/dettaglioPiano/:id', to: 'main#dettaglioPiano'

  get '/insegnanti', to: 'main#insegnanti'

  get '/dettaglioInsegnante/:id', to: 'main#dettaglioInsegnante'

  get '/classi/:id', to: 'main#classi'

  get '/dettaglioClasse/:id', to: 'main#dettaglioClasse'

  get '/rappr_genitori', to: 'main#genitori'


end
