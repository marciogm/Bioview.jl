function main()
    install_ngl()
end

function install_ngl()
    info("Downloading NGL files")
    if !ispath("downloads/ngl")
        mkpath("downloads/ngl")
    end

    download("https://raw.githubusercontent.com/arose/ngl/master/dist/ngl.js", "downloads/ngl/ngl.js")
end

main()
