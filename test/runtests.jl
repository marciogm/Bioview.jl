using Bioview
using Base.Test

TESTS = [
    "MSA.jl"
]

function main()
    root = dirname(@__FILE__)
    for test in TESTS
        include(test)
    end
end

main()
