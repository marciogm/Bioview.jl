module Bioview

include("options.jl")
include("MSA.jl")

isijulia() = isdefined(Main, :IJulia) && Main.IJulia.inited

if isijulia()
    js = """
    (function (\$) {
        require.config({
            paths: {
                'msa': 'https://cdn.bio.sh/msa/latest/msa.min.gz'
            },
            shim: {
                'msa': {
                    exports: 'msa'
                }
            }
        });
     })(jQuery);
     """
    display("text/html", """<div id="require-js-bioview-status"></div>""")
    display("text/javascript", js)
    display("text/javascript", """console.log("[Bioview] loaded");""")
end

end
