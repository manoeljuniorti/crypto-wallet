class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso Ruby on Rails - Manoel Junior"
    session[:curso] = "Curso Ruby on Rails - Manoel Junior"
    @meu_nome = "Manoel"
    @curso = "Rails"
  end

  def define_locale
    redirect_back(fallback_location:root_path)
  end
end
