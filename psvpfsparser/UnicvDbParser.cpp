#include "UnicvDbParser.h"

#include <string>
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <iomanip>

#include <filesystem>

#include "UnicvDbTypes.h"

UnicvDbParser::UnicvDbParser(std::filesystem::path titleIdPath, std::ostream& output)
   : m_titleIdPath(titleIdPath), m_output(output)
{
}

int UnicvDbParser::parse()
{
   if(!std::filesystem::exists(m_titleIdPath))
   {
      m_output << "Root directory does not exist" << std::endl;
      return -1;
   }

   std::filesystem::path root(m_titleIdPath);

   std::filesystem::path filepath = root / "sce_pfs" / "unicv.db";

   if(!std::filesystem::exists(filepath))
   {
      std::filesystem::path filepath2 = root / "sce_pfs" / "icv.db";
      if(!std::filesystem::exists(filepath2) || !std::filesystem::is_directory(filepath2))
      {
         m_output << "failed to find unicv.db file or icv.db folder" << std::endl;
         return -1;
      }
      else
      {
         m_output << "parsing  icv.db..." << std::endl;

         m_fdb = std::unique_ptr<sce_idb_base_t>(new sce_icvdb_t(m_output));
         if(!m_fdb->read(filepath2))
            return -1;

         return 0;
      }
   }
   else
   {
      m_output << "parsing  unicv.db..." << std::endl;

      m_fdb = std::unique_ptr<sce_idb_base_t>(new sce_irodb_t(m_output));
      if(!m_fdb->read(filepath))
         return -1;

      return 0;
   }
}

const std::unique_ptr<sce_idb_base_t>& UnicvDbParser::get_idatabase() const
{
   return m_fdb;
}