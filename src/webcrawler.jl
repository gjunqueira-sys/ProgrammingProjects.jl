module webcrawler


using HTTP
using Gumbo
using Cascadia
using .Cascadia: nodeText
import Cascadia: matchFirst 
import Cascadia: nodeText


export fetchrandom, fetchpage, articleinfo 

const PAGE_URL = "https://en.wikipedia.org/wiki/Julia_(programming_language)" 
const LINKS = String[] 
 
function fetchpage(url) 
  url = startswith(url, "/") ? buildurl(url) : url 
 
  response = HTTP.get(url) 
 
  if response.status == 200 && length(response.body) > 0 
    String(response.body) 
  else  
    "" 
  end 
end 
 


function extractlinks(elem) 
  if  isa(elem, HTMLElement) &&  tag(elem) == :a && in("href", collect(keys(attrs(elem)))) 
      url = getattr(elem, "href") 
      startswith(url, "/wiki/") && push!(LINKS, url) 
  end 
 
  for child in children(elem) 
    extractlinks(child) 
  end 
end 
 


function extracttitle(elem) 
  matchFirst(Selector("#section_0"), elem) |> nodeText 
end 
 


function extractimage(elem) 
  e = matchFirst(Selector(".content a.image img"), elem) 
  isa(e, Nothing) ? "" : e.attributes["src"] 
end 
 


function fetchrandom() 
  fetchpage(RANDOM_PAGE_URL) 
end 



function articledom(content) 
  if ! isempty(content) 
    return Gumbo.parsehtml(content) 
  end 
 
  error("Article content can not be parsed into DOM") 
end 
 


function articleinfo(content) 
  dom = articledom(content) 
 
  Dict( :content => content,  
        :links => extractlinks(dom.root),  
        :title => extracttitle(dom.root),  
        :image => extractimage(dom.root) 
  ) 
end 
 


function buildurl(article_url) 
  PROTOCOL * DOMAIN_NAME * article_url 
end 



end


