library(twitteR)

setup_twitter_oauth('B5EGpEFf2L1lfRCKY0SsEH7c6'
                   ,'et1rST22a3iCGoxeHQIcAuEYtkpzbTy09WacAIv1brYPDviQIA'
                   ,'20330237-K84AuP3aIsk0xWcuvhMz1QfWP4WcjGIDzxpLgFlGj'
                   ,'pBQXy3PttqU1v1qIHTFzO3zMHDFHUz1nq2VYTOYkzgOyt')

tweets = searchTwitter('#beermaw', n=100, since = '2018-06-26')
