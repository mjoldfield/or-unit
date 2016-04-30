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

testDVoid  = TestCase $ assertEqual "Can be a void"   () (doubleOrVoid x)

length' :: (OrUnit a Int) => [b] -> a
length' = orUnit . length

testLength = TestCase $ assertEqual "Length can be an int" (1 :: Int)  (length' "a")

testLVoid  = TestCase $ assertEqual "Length can be void"   () (length' "a")

main :: IO Counts
main = runTestTT $ TestList [ testDouble, testDVoid, testLength, testLVoid ]
