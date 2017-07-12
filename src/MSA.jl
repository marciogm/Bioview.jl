using JSON

export MSA, ColorScheme, Conf, Columns, Vis, Zoomer, plot

struct MSA
    seq::AbstractString
    options::Dict
    div::String
    div_seqs::String

    function MSA(seq::AbstractString, options...)
        if isempty(options)
            new(seq, Dict(), Base.Random.randstring(), Base.Random.randstring())
        else
            if isavalidtype(options)
                new(seq, merge_options!(options), Base.Random.randstring(), Base.Random.randstring())
            end
        end
    end
end

struct Columns <: Options
    fields::Dict{AbstractString, Any}
    function Columns(;kwargs...)
        opts = merge_options!("columns", kwargs)
        new(opts)
    end
end

struct ColorScheme <: Options
    fields::Dict{AbstractString, Any}
    function ColorScheme(;kwargs...)
        opts = merge_options!("colorscheme", kwargs)
        new(opts)
    end
end

struct Conf <: Options
    fields::Dict{AbstractString, Any}
    function Conf(;kwargs...)
        opts = merge_options!("conf", kwargs)
        new(opts)
    end
end

struct Vis <: Options
    fields::Dict{AbstractString, Any}
    function Vis(;kwargs...)
        opts = merge_options!("vis", kwargs)
        new(opts)
    end
end

struct Zoomer <: Options
    fields::Dict{AbstractString, Any}
    function Zoomer(;kwargs...)
        opts = merge_options!("zoomer", kwargs)
        new(opts)
    end
end

function plot(msa::MSA)
    plot_msa(msa)
end

function plot_msa(msa::MSA)
    options = """
    {
       el: $(msa.div),
       seqs: seqs,
       bootstrapMenu: true,
       $(JSON.json(msa.options)[2:end-1])
    }
    """

    txt_html = """
    <div id="$(msa.div)">
      <pre style="display: none" id="$(msa.div_seqs)">$(msa.seq)</pre>

      <script charset="utf-8" type="text/javascript">
        (function (\$) {

            require(['msa'], function(Msa) {
                var fasta = document.getElementById("$(msa.div_seqs)").innerText;
                var seqs = Msa.io.fasta.parse(fasta);
                var m = Msa($(options));
                m.render();
                console.log("[Bioview] MSA loadded");
            });
         })(jQuery);
      </script>
    </div>
    """
    display("text/html", txt_html)
end
