export BioviewError

type BioviewError <: Exception
    message::AbstractString
end

Base.show(io::IO, e::BioviewError) = show(io, "Bioview error: $(e.message)")
