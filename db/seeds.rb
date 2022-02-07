
spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

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
          }
        ]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success("(Cadastro concluído!)")