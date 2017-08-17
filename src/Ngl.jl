module Ngl

export plot_pdb

function initialize()
    insert_ngl_script_tag()
    display("text/javascript", """console.log("[Bioview] NGL loaded");""")
end

function insert_ngl_script_tag()
    ngl_file = readstring(open("$(dirname(@__FILE__))/../deps/downloads/ngl/ngl.js"))
    src = """
        <script charset="utf-8" type='text/javascript'>
            define('ngl', function(require, exports, module) {
                $(ngl_file)
            });
        </script>
    """
    display("text/html", src)
end


function plot_pdb()
    txt_html = """
    <div id="ngl_div_test">
        <div id="viewport" style="width:800px; height:800px;"></div>

        <script charset="utf-8" type="text/javascript">
            (function (\$) {
                var stage;
                require(['ngl'], function(NGL) {
                    stage = new NGL.Stage("viewport");
                    stage.loadFile("rcsb://4u5f", {defaultRepresentation: true});
                });
             })(jQuery);
        </script>
    </div>
    """
    display("text/html", txt_html)
end


if isdefined(Main, :IJulia) && Main.IJulia.inited
    initialize()
end 

end
