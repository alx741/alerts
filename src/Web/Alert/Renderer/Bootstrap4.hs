{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Bootstrap4
    ( renderAlertsBootstrap4
    ) where

import Data.Text.Lazy
import Text.Blaze.Html

import Web.Alert
import Web.Alert.Renderer.Common

-- | Render alerts using Bootstrap v4.x alerts
renderAlertsBootstrap4 :: [(AlertStatus, Text)] -> Text
renderAlertsBootstrap4 = renderAlerts
    "alert" [] (Just $ customAttribute "role" "alert") bootstrap4Clases

bootstrap4Clases :: AlertStatus -> AttributeValue
bootstrap4Clases Default = "alert-primary"
bootstrap4Clases Info = "alert-info"
bootstrap4Clases Success = "alert-success"
bootstrap4Clases Warning = "alert-warning"
bootstrap4Clases Error = "alert-danger"
