module ProgrammingProjects

using HTTP
using Gumbo 

include("webcrawler.jl")
using .webcrawler: PAGE_URL
using .webcrawler: LINKS
using .webcrawler: fetchpage


export PAGE_URL
export LINKS
export fetchpage




end
