#ifndef TOYROBOT_OPTIONEXCEPTION_H_
#define TOYROBOT_OPTIONEXCEPTION_H_

#include <exception>

class noneGetException: public std::exception
{
  virtual const char* what() const throw()
  {
    return "Called get on None.";
  }
};

#endif // TOYROBOT_OPTIONEXCEPTION_H_
