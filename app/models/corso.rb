class Corso < ActiveRecord::Base

    def self.getInsegnante(corso)
            @insegnante = Insegnante.find(corso.insegnante_id)
    end

    def self.getPiano(corso)
            @piano = Piano.find(corso.piano_id)
    end

    def self.getClasse(corso)
            @classe = Classe.find(corso.classe_id)
    end

end
