rm(list=ls(all=TRUE))
library(XML)
library(bitops)
library(RCurl)
library(httr)

orgURL1 = 'http://www.gck99.com.tw/gold1.php?yy=2015&mm=0'

startPage = 1
endPage = 9
alldata = data.frame()
for( i in startPage:endPage)
{
  goldURL1 <- paste(orgURL1, i, sep='')
  urlExists = url.exists(goldURL)
  
  if(urlExists)
  {
    html = getURL(goldURL1, ssl.verifypeer = FALSE)
    xml = htmlParse(html, encoding ='utf-8')
    date = xpathSApply(xml, "//tr[@class='main_1']//td[1]", xmlValue)
    price = xpathSApply(xml, "//tr[@class='main_1']//td[2]", xmlValue)
    tempdata = data.frame(date, price)
  }
  alldata = rbind(alldata, tempdata)
}

orgURL2 = 'http://www.gck99.com.tw/gold1.php?yy=2015&mm='

startPage = 10
endPage = 12
alldata = data.frame()
for( i in startPage:endPage)
{
  goldURL2 <- paste(orgURL2, i, sep='')
  urlExists = url.exists(goldURL2)
  
  if(urlExists)
  {
    html = getURL(goldURL2, ssl.verifypeer = FALSE)
    xml = htmlParse(html, encoding ='utf-8')
    date = xpathSApply(xml, "//tr[@class='main_1']//td[1]", xmlValue)
    price = xpathSApply(xml, "//tr[@class='main_1']//td[2]", xmlValue)
    tempdata = data.frame(date, price)
  }
  alldata = rbind(alldata, tempdata)
}

write.csv(alldata,"alldata.csv")
