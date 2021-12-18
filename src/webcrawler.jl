
module webcrawler

using HTTP, Gumbo 

export PAGE_URL
export LINKS
export fetchpage


const PAGE_URL = "https://en.wikipedia.org/wiki/Julia_(programming_language)" 

const LINKS = String[] 

function fetchpage(url)
    response = HTTP.get(url)
    if response.status == 200 && parse(Int, Dict(response.headers)["Content-Length"]) > 0
        String(response.body)
    else
        ""
    end
end 



end