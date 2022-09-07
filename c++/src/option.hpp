#ifndef TOYROBOT_OPTION_H_
#define TOYROBOT_OPTION_H_

#include "optionException.hpp"

template<class T>
class Option {
  T x;
  bool isDefined;

 public:

  Option(T t, bool d) : x(t), isDefined(d)
  { /**/ }

  T get() const {
    if( isSome() ) {
      return x;
    } else {
      throw noneGetException();
    }
  }

  T getOrElse(const T& orElse) const {
    if( isSome() ) {
      return x;
    } else {
      return orElse;
    }
  }

  bool isNone() const {
    return ! isDefined;
  }

  bool isSome() const {
    return isDefined;
  }

  bool isEmpty() const {
    return ! isDefined;
  }
};

template<class T>
Option<T> Some(const T& t) {
  return Option<T>(t, true);
}

template<class T>
Option<T> None() {
  return Option<T>(T(), false);
}

#endif // TOYROBOT_OPTION_H_
