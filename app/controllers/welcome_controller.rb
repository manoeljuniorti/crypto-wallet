class WelcomeController < ApplicationController
  def index
    @meu_nome = "Manoel"
    @curso = "Rails"
  end
end
