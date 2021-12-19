module ProgrammingProjects

using HTTP
using Gumbo 
using Cascadia

include("webcrawler.jl")
# using .webcrawler: PAGE_URL
# using .webcrawler: LINKS
using .webcrawler: fetchpage
using .webcrawler: extractlinks
using .webcrawler: extracttitle
using .webcrawler: extractimage
using .webcrawler: articleinfo
using .webcrawler: articledom

# export PAGE_URL
# export LINKS
export fetchpage
export extractlinks
export extracttitle
export extractimage
export articleinfo
export articledom





end
