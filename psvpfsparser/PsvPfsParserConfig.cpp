#include "PsvPfsParserConfig.h"

#include <string>
#include <iostream>

#include <CLI11.hpp>

#define HELP_NAME "help"
#define TITLE_ID_SRC_NAME "title_id_src"
#define TITLE_ID_DST_NAME "title_id_dst"
#define KLICENSEE_NAME "klicensee"
#define ZRIF_NAME "zRIF"
#define F00D_URL_NAME "f00d_url"
#define F00D_CACHE_NAME "f00d_cache"



CLI::App* get_options_desc(PsvPfsParserConfig& cfg) {
    auto app = new CLI::App("Options");

    app->add_option("-i,--title_id_src", cfg.title_id_src, "Source directory that contains the application. Like PCSC00000.")
        ->required();
    app->add_option("-o,--title_id_dst", cfg.title_id_dst, "Destination directory where everything will be unpacked. Like PCSC00000_dec.")
        ->required();
    app->add_option("-k,--klicensee", cfg.klicensee, "klicensee hex coded string. Like 00112233445566778899AABBCCDDEEFF.");
    app->add_option("-z,--zrif", cfg.zRIF, "zRIF string.");

    return app;
}

int parse_options(int argc, char* argv[], PsvPfsParserConfig& cfg) {
    CLI::App* app = get_options_desc(cfg);

    try {
        app->parse(argc, argv);

        if (cfg.title_id_src.empty()) {
            std::cerr << "Missing option --title-id-src" << std::endl;
            return -1;
        }

        if (cfg.title_id_dst.empty()) {
            std::cerr << "Missing option --title-id-dst" << std::endl;
            return -1;
        }

        if (cfg.klicensee.empty()) {
            if (cfg.zRIF.empty()) {
                std::cerr << "Missing option --klicensee or --zrif" << std::endl;
                std::cout << "sealedkey will be used" << std::endl;
            }
        }

        return 0;
    }
    catch (const CLI::ParseError &e) {
        return app->exit(e);
    }
}

