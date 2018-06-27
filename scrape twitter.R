library(twitteR)

setup_twitter_oauth('xxx'
                   ,'xxx'
                   ,'xxx'
                   ,'xxx')

tweets = searchTwitter('#beermaw', n=100, since = '2018-06-26')
