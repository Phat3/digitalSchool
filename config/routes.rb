Rails.application.routes.draw do

  root 'main#index'

  ###### ROUTES ADMIN ######

  get '/admin/index', to: 'admin/admin#index'

  get '/admin/piani', to: 'admin/piani#piani'

  get '/admin/pianiAdd', to: 'admin/piani#pianiAdd'

  post '/admin/aggiungiPiano', to: 'admin/piani#aggiungiPiano'

  post '/admin/eliminaPiano', to: 'admin/piani#eliminaPiano'

  get '/admin/corsi', to: 'admin/corsi#index'

  get '/admin/corsiAdd', to: 'admin/corsi#corsiAdd'

   get '/admin/corsiEdit/:id', to: 'admin/corsi#edit'

  post '/admin/aggiungiCorso', to: 'admin/corsi#aggiungi'

  post '/admin/getInfoCorsi', to: 'admin/corsi#getInfo'

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

  ###### ROUTES UTENTE ######

  get '/history', to: 'main#history'

end
