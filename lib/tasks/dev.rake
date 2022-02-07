namespace :dev do
  desc "Configurando o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end
  desc "Cadastra moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do

      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://toppng.com/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png"
        },

        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo.png"
        },

        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://flyclipart.com/thumb2/dash-coin-690652.png"
        },
        {
          description: "Iota",
          acronym: "IOT",
          url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/512/IOTA-icon.png"
        },
        {
          description: "Zcash",
          acronym: "ZEC",
          url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/512/Zcash-ZEC-icon.png"
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end


  desc "Cadastra os Tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando Tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end


  private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
