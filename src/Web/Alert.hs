module Web.Alert where

data AlertStatus
    = Default
    | Info
    | Success
    | Warning
    | Error
    deriving (Bounded, Eq, Show, Read)
