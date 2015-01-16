import httpclient
import cgi
import strutils
import xmlparser
import xmltree
import streams


# Create the return types.
type YWeather* = tuple[sunrise : string, sunset : string, humidity : string, pressure : string, rising : string,
visibility : string, code : string, date : string, temp : string, condition : string, title : string,
latitude : string, longitude : string, htmlDescription : string, link : string, city : string,
country : string, region : string, windChill : string, windDirection : string, windSpeed : string,
distanceUnits : string, pressureUnits : string, speedUnits : string, tempUnits : string]




# Build the URL.
var baseurl = "https://query.yahooapis.com/v1/public/yql?"
var yqlquery = "select%20wind%20from%20weather.forecast%20where%20woeid=2460286"
let yqlurl = baseurl & "q=" &  yqlquery & "&format=json"
#& "&format=json"

# Get the data
#echo(getContent("www.nim-lang.org"))
let s1 = "http://en.wikipedia.org/w/index.php?title=Special%3ASearch&profile=default&search=test&fulltext=Search"
echo getContent(yqlurl)
#"https://query.yahooapis.com/v1/public/yql?q=select%20wind%20from%20weather.forecast%20where%20woeid=2460286"
