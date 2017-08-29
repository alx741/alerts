{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Foundation5
    ( renderAlertsFoundation5
    , AlertType(..)
    ) where

import Data.Text.Lazy
import Text.Blaze.Html

import Web.Alert
import Web.Alert.Renderer.Common

-- | Render alerts using Foundation v5.x alerts
renderAlertsFoundation5 :: AlertType -> [(AlertStatus, Text)] -> Text
renderAlertsFoundation5 atype = renderAlerts
    "alert-box" [alertTypeClass atype] (Just $ dataAttribute "alert" "") foundation5Clases

-- | Foundation 5.x alert type
data AlertType
    = Radius -- ^ Slightly rounded corners
    | Round -- ^ Fully rounded corners
    deriving (Eq, Show, Read)

alertTypeClass :: AlertType -> AttributeValue
alertTypeClass Radius = "radius"
alertTypeClass Round = "round"

foundation5Clases :: AlertStatus -> AttributeValue
foundation5Clases Default = "secondary"
foundation5Clases Info = "info"
foundation5Clases Success = "success"
foundation5Clases Warning = "warning"
foundation5Clases Error = "alert"
