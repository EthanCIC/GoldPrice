usd <- read.csv('USD.csv')
usd <- usd[order(as.Date(usd$date, format="%Y-%m-%d")),]
write.csv(usd, 'USD.csv', row.names = FALSE)

gold <- read.csv('GOLD.csv')
gold <- gold[order(as.Date(gold$date, format="%Y-%m-%d")),]
write.csv(gold, 'GOLD.csv', row.names = FALSE)
