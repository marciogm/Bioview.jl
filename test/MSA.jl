@testset "MSA Widget" begin
    @testset "Options" begin
        color = ColorScheme(scheme="taylor", colorBackground=true)
        @test color.fields == Dict("colorscheme" => Dict("scheme" => "taylor", "colorBackground" => true))

        conf = Conf(eventBus = true, alphabetSize = 20)
        @test conf.fields == Dict("conf" => Dict("eventBus" => true, "alphabetSize" => 20))

        columns = Columns(hidden = [1,2])
        @test columns.fields == Dict("columns" => Dict("hidden" => [1,2]))

        vis = Vis(sequences =  true, markers = true)
        @test vis.fields == Dict("vis" => Dict("sequences" => true, "markers" => true))

        zoomer = Zoomer(alignmentWidth =  "auto", alignmentHeight = 225)
        @test zoomer.fields == Dict("zoomer" => Dict("alignmentWidth" => "auto", "alignmentHeight" => 225))
    end

    @testset "MSA" begin
        seqs = ">seq1\nACGT\n>seq2\nACGT"

        msa = MSA(seqs)
        @test typeof(msa) == MSA

        msa = MSA(seqs, ColorScheme(scheme="taylor"), Zoomer(aling = "auto"))
        @test typeof(msa) == MSA

        @test_throws BioviewError MSA(seqs, Dict("color" => "taylor"))
    end
end
