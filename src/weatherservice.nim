import httpclient
import json
import strutils

proc toCelsius(f : float) : float =
  return (f - 32.0) * 5.0/9.0 

proc getForecast*(place : string) : string =
  let query = "select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text=\"" & place & "\")"
  var baseurl = "https://query.yahooapis.com/v1/public/yql?&" 
  let yqlurl = baseurl & "q=" &  query & "&format=json"
  return getContent(yqlurl)

proc getForecast(json : JsonNode) =
    if json.kind == JObject:
      var days = json["query"]["results"]["channel"]["item"]["forecast"]
      var obj = newJObject()
      echo(days)
      
      for day in items(days):
        obj["high"] = % toCelsius(parseFloat(day["high"].str))
        obj["low"] = % toCelsius(parseFloat(day["low"].str))
      echo($obj)


let s1 = "malmoe"
var res = parseJson(getForecast(s1))
getForecast(res)
#echo(res)



