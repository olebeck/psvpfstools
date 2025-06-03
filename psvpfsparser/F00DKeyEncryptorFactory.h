#pragma once

#include <string>
#include <memory>

#include "IF00DKeyEncryptor.h"
#include "ICryptoOperations.h"

class F00DKeyEncryptorFactory
{
public:
   template<typename Targ>
   static std::shared_ptr<IF00DKeyEncryptor> create(Targ arg);
};

template<>
std::shared_ptr<IF00DKeyEncryptor> F00DKeyEncryptorFactory::create<std::shared_ptr<ICryptoOperations> >(std::shared_ptr<ICryptoOperations> arg);