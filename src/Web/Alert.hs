-- | Create web 'Alert's of a given 'AlertStatus'

module Web.Alert
    ( Alert(..)
    , AlertStatus(..)
    ) where

import Data.Text.Lazy

data Alert = Alert
    { alertStatus  :: AlertStatus
    , alertMessage :: Text
    } deriving (Eq, Show, Read)

data AlertStatus
    = Default
    | Info
    | Success
    | Warning
    | Error
    deriving (Bounded, Eq, Show, Read)
