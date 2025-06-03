#pragma once

#include <memory>

#include "UnicvDbTypes.h"

class UnicvDbParser
{
private:
   std::filesystem::path m_titleIdPath;

   std::unique_ptr<sce_idb_base_t> m_fdb;
   std::ostream& m_output;

public:
   UnicvDbParser(std::filesystem::path titleIdPath, std::ostream& output);

public:
   int parse();

public:
   const std::unique_ptr<sce_idb_base_t>& get_idatabase() const;
};
