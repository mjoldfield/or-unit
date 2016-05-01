# OrUnit

_A simple experiment in polymorphic return codes._

## Rationale

I was keen to add return codes to some functions which
presently return unit `()`. To preserve backwards
compatibility, I wondered if could make the _same_ function
return both data and `()` depending on the type instance.

## Example

The package’s test script shows the idea:


```haskell
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE FlexibleContexts           #-}

import OrUnit
import Test.HUnit

sqrt' :: (OrUnit a Double) => Double -> a
sqrt' = orUnit . sqrt

doubleOrVoid :: (OrUnit c Double) => Double -> c
doubleOrVoid x = sqrt' (x * x)

x = 2

testDouble = TestCase $ assertEqual "Can be a double" x  (doubleOrVoid x)

testDVoid  = TestCase $ assertEqual "Can be void"     () (doubleOrVoid x)

main :: IO Counts
main = runTestTT $ TestList [ testDouble, testDVoid ]
```

On the plus side, we do indeed have a function which returns diffeent
types. However, we need a couple of GHC extensions enabled in the code
which calls the polymorphic function, and we need to specify more
types explicitly.

It is possible that other GHC extensions would make this trick easier
to use.

## Grabbing

The project uses [stack](http://docs.haskellstack.org/en/stable/README).
Once you’ve installed stack, installing this is easy:

```
$ git clone https://github.com/mjoldfield/or-unit.git
$ stack test
```

Or if you want to tinker:

```
$ stack ghci
```
