install.packages("twitteR")

library(twitteR)
api_key <- ""
api_secret <- ""
access_token <- ""
access_token_secret <- ""

setup_twitter_oauth(api_key,api_secret)

tweets <- userTimeline("elEconomistaes", n = 100)
