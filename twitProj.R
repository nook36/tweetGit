EnsurePackage<-function(x)
{
  x<-as.character(x)
  if(!require(x,character.only = TRUE))
  {
    install.packages(pkgs=x,repos = "http://cran.r-project.org")
    require(x,character.only = TRUE)
  }
}

PrepareTwitter<-function()
{
  EnsurePackage("bitops")
  EnsurePackage("RCurl")
  EnsurePackage("RJSONIO")
  EnsurePackage("twitteR")
}

#TweetFrame()-Return a dataframe based on a search of Twitter
TweetFrame<-function(searchTerm,maxTweets)
{
  twtList<-searchTwitter(searchTerm,n=maxTweets)
  #as.data.frame() coerces each list element into a row
  #lapply() applies this to all of the elements in twtList
  #rbind() takes all of the rows and put them together
  #do.call() gives rbind() all the rows as individual elements
  ##
  return(do.call("rbind",lapply(twtList,as.data.frame)))
}