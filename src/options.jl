abstract type Options end

function merge_options!(name::String, opts::Array{Any,1})
    values = Dict{String, Any}()
    [merge!(values, Dict(string(x[1]) => x[2])) for x in opts]
    ret = Dict(name => values)
    return ret
end

function merge_options!(opts::Tuple)
    values = Dict{String, Any}()
    [merge!(values, x.fields) for x in opts]
    return values
end

function isavalidtype(t::DataType)
    if !issubtype(t, Options)
        throw(BioviewError("$(t): It's not a valid Option"))
    end
    return true
end

function isavalidtype(options::Tuple)
    opts = map(x -> typeof(x), options)
    for t in opts
        isavalidtype(t)
    end
    return true
end
