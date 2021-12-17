using ProgrammingProjects
using Documenter

DocMeta.setdocmeta!(ProgrammingProjects, :DocTestSetup, :(using ProgrammingProjects); recursive=true)

makedocs(;
    modules=[ProgrammingProjects],
    authors="Gil Junqueira",
    repo="https://github.com/gjunqueira-sys/ProgrammingProjects.jl/blob/{commit}{path}#{line}",
    sitename="ProgrammingProjects.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gjunqueira-sys.github.io/ProgrammingProjects.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gjunqueira-sys/ProgrammingProjects.jl",
    devbranch="main",
)
