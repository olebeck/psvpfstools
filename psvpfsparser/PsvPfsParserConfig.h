#pragma once

#include <string>

#include "F00DKeyEncryptorFactory.h"

struct PsvPfsParserConfig
{
   std::string title_id_src;
   std::string title_id_dst;
   std::string klicensee;
   std::string zRIF;
};

int parse_options(int argc, char* argv[], PsvPfsParserConfig& cfg);