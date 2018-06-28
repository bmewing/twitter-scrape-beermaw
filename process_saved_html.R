library(rvest)
library(stringr)
library(lubridate)
library(magrittr)

extract_images = function(tweet){
  output = tweet %>% 
    html_nodes("img") %>% 
    html_attr("src") %>% 
    grep("media",.,value=TRUE)
  return(output)
}

page = read_html("all tweets until June 27.html")
tweets = page %>% 
  html_nodes("div.tweet")
users = tweets %>% 
  html_attr("data-screen-name")
timestamp = tweets %>% 
  html_node("span._timestamp") %>% 
  html_attr("data-time") %>% 
  as.numeric() %>% 
  lubridate::as_datetime()
text = tweets %>% 
  html_node("p.tweet-text") %>% 
  html_text() %>% 
  sub("pic\\.twitter\\.com/.*$","",.)
images = lapply(tweets,extract_images)
image_count = unlist(lapply(images,length))
replies = tweets %>% 
  html_node("span.ProfileTweet-action--reply") %>% 
  html_text() %>% 
  stringr::str_extract("[0-9]+") %>% 
  as.numeric()
retweets = tweets %>% 
  html_node("span.ProfileTweet-action--retweet") %>% 
  html_text() %>% 
  stringr::str_extract("[0-9]+") %>% 
  as.numeric()
likes = tweets %>% 
  html_node("span.ProfileTweet-action--favorite") %>% 
  html_text() %>% 
  stringr::str_extract("[0-9]+") %>% 
  as.numeric()

data = data.frame(user = users
                 ,time = timestamp
                 ,text = text
                 ,images = image_count
                 ,like = likes
                 ,retweet = retweets
                 ,reply = replies)

data = data[grepl("#beermaw",data$text,ignore.case = TRUE),]
