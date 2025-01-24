# frozen_string_literal: true

class Templates
  MENSAGENS = {
    initial_message: "Welcome to the Number Guessing Game!\n
                      I'm thinking of a number between 1 and 100.",
    options: "Please select the difficulty level:\n
              1. Easy (10 chances)\n
              2. Medium (5 chances)\n
              3. Hard (3 chances)\n",
    right_answer: "Atenção! Verifique os dados antes de prosseguir."
  }

  def self.show(type)
    MENSAGENS.fetch(type, 'Tipo de mensagem desconhecido.')
  end
end
