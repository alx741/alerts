module Web.Alert
    ( -- * Alerts Status
      AlertStatus(..)
    ) where

data AlertStatus
    = Default
    | Info
    | Success
    | Warning
    | Error
    deriving (Bounded, Eq, Show, Read)
