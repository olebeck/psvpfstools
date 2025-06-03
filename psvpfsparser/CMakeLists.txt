cmake_minimum_required (VERSION 3.20.0)
project(psvpfsparser)

add_executable (${PROJECT_NAME}
   "IF00DKeyEncryptor.h"
   "F00DKeyEncryptorFactory.h"
   "F00DKeyEncryptorFactory.cpp"
   "F00DNativeKeyEncryptor.h"
   "F00DNativeKeyEncryptor.cpp"
   "ICryptoOperations.h"
   "LibTomCryptCryptoOperations.h"
   "LibTomCryptCryptoOperations.cpp"
   "CryptoOperationsFactory.h"
   "CryptoOperationsFactory.cpp"
   "FilesDbParser.h"
   "HashTree.h"
   "NodeIcvCalculator.h"
   "PfsCryptEngine.h"
   "PfsCryptEngineBase.h"
   "PfsCryptEngineSelectors.h"
   "PfsKeyGenerator.h"
   "PfsKeys.h"
   "SceKernelUtilsForDriver.h"
   "SceSblSsMgrForDriver.h"
   "SecretGenerator.h"
   "UnicvDbParser.h"
   "UnicvDbTypes.h"
   "UnicvDbUtils.h"
   "Utils.h"
   "PsvPfsParserConfig.h"
   "LocalKeyGenerator.h"
   "LocalKeys.h"
   "IcvPrimitives.h"
   "FlagOperations.h"
   "PfsPageMapper.h"
   "PfsFilesystem.h"
   "PfsFile.h"
   "FilesDbParser.cpp"
   "HashTree.cpp"
   "NodeIcvCalculator.cpp"
   "PfsCryptEngine.cpp"
   "PfsCryptEngineBase.cpp"
   "PfsCryptEngineSelectors.cpp"
   "PfsKeyGenerator.cpp"
   "PfsKeys.cpp"
   "psvpfsparser.cpp"
   "SceKernelUtilsForDriver.cpp"
   "SceSblSsMgrForDriver.cpp"
   "SecretGenerator.cpp"
   "UnicvDbParser.cpp"
   "UnicvDbTypes.cpp"
   "UnicvDbUtils.cpp"
   "Utils.cpp"
   "PsvPfsParserConfig.cpp"
   "LocalKeyGenerator.cpp"
   "LocalKeys.cpp"
   "IcvPrimitives.cpp"
   "FlagOperations.cpp"
   "PfsPageMapper.cpp"
   "PfsFilesystem.cpp"
   "PfsFile.cpp"
)

set_property(TARGET ${PROJECT_NAME} PROPERTY FOLDER "executables")
install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)

target_link_libraries (${PROJECT_NAME} zRIF b64 zlibstatic libtomcrypt)

if (CMAKE_COMPILER_IS_GNUCXX)
   target_link_libraries(${PROJECT_NAME} -static -static-libgcc -static-libstdc++)
endif()

target_include_directories(${PROJECT_NAME} PRIVATE ..)

