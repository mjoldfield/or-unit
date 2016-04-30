{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE FlexibleInstances          #-}

module OrUnit (OrUnit, orUnit) where

class OrUnit b a where
  orUnit :: a -> b 

instance OrUnit () a where
 orUnit a = ()

instance OrUnit a a where
 orUnit a = a
