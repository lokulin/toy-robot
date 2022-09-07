import typetraits

type
  Option*[T] = object
    isDefined: bool
    x: T

proc None*(A: typedesc): Option[A] =
  Option[A]()

proc Some*[A](x: A): Option[A] =
  Option[A](x: x, isDefined: true)

proc empty*(A: typedesc): Option[A] = None(A)

proc isSome*[A](x: Option[A]): bool =
  x.isDefined

proc isNone*[A](x: Option[A]): bool =
  not x.isDefined

proc get*[A: Option, B](this: A): B =
  if this.isNone:
    raise newException(NoSuchElement, "Failed to get from None")
  this.x

proc getOrElse*[A: Option, B](this: A, default: B): B {.inline.} =
  if this.isSome:
    this.x
  else:
    default

proc isEmpty*[A: Option](this: A): bool =
  not this.isDefined

proc isDefined*[A: Option](this: A): bool =
  this.isDefined

proc map*[A,B](this: Option[A], f: proc (x: A):B ): Option[B] {.inline.} =
  if (this.isEmpty):
    None(B)
  else:
    Some[B](f(this.get))

proc fold*[A,B](this: Option[A], ifEmpty: proc():B, f: proc (x: A):B): B {.inline.} =
  if (this.isEmpty):
    ifEmpty()
  else:
    f(this.get)

proc flatMap*[A,B](this: Option[A], f: proc(x: A):Option[B] ): Option[B] {.inline.} =
  if (this.isEmpty):
    None(B)
  else:
    f(this.get)

proc filter*[A](this: Option[A], p: proc(x: A):bool ): Option[A] {.inline.} =
  if (this.isEmpty or p(this.get)):
    this
  else:
    None(A)

proc filterNot*[A](this: Option[A], p: proc(x: A):bool ): Option[A] {.inline.} =
  if (this.isEmpty or not p(this.get)):
    this
  else:
    None(A)

proc contains*[A](this: Option[A], elem: A): bool =
  not this.isEmpty and this.get == elem

proc exists*[A](this: Option[A], p: proc(x: A):bool): bool {.inline.} =
  not this.isEmpty and p(this.get)

type NoSuchElement* = object of Exception
