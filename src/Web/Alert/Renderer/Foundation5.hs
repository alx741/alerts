{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Foundation5
    ( AlertType(..)
    , renderAlertsFoundation5
    ) where

import Data.Text.Lazy hiding (pack)
import Text.Blaze.Html

import Web.Alert
import Web.Alert.Renderer.Common

-- | Foundation 5.x alert type
data AlertType
    = Radius -- ^ Slightly rounded corners
    | Round -- ^ Foully round corners
    deriving (Eq, Show, Read)

-- | Render alerts using Foundation v5.x alerts
renderAlertsFoundation5 :: [(AlertStatus, Text)] -> Text
renderAlertsFoundation5 = renderAlerts
    "alert-box" (Just $ dataAttribute "alert" "") foundation5Clases

foundation5Clases :: AlertStatus -> AttributeValue
foundation5Clases Default = "secondary"
foundation5Clases Info = "info"
foundation5Clases Success = "success"
foundation5Clases Warning = "warning"
foundation5Clases Error = "alert"
