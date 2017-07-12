@testset "Errors" begin
    err = BioviewError("sorry :(")
    iobuf = IOBuffer(25)
    show(iobuf, err)
    
    @test String(iobuf.data) == "\"Bioview error: sorry :(\""
end
