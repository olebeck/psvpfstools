#include "F00DKeyEncryptorFactory.h"

#include "F00DNativeKeyEncryptor.h"

template<>
std::shared_ptr<IF00DKeyEncryptor> F00DKeyEncryptorFactory::create<std::shared_ptr<ICryptoOperations> >(std::shared_ptr<ICryptoOperations> arg)
{
   return std::make_shared<F00DNativeKeyEncryptor>(arg);
}