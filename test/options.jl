struct ValidType <: Options end
struct InvalidType end

@testset "Options" begin
    @test Bioview.isavalidtype(Options) == true
    @test Bioview.isavalidtype(ValidType) == true
    @test_throws BioviewError Bioview.isavalidtype(InvalidType)

    opt = ValidType()
    oopt = ValidType()
    opts = (opt, oopt)
    @test Bioview.isavalidtype(opts) == true

    invalid_opt = InvalidType()
    opts = (opt, oopt, invalid_opt)
    @test_throws BioviewError Bioview.isavalidtype(opts)
end
