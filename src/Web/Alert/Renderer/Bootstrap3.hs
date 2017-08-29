{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Bootstrap3
    ( renderAlertsBootstrap3
    ) where

import Data.Text.Lazy hiding (pack)
import Text.Blaze.Html

import Web.Alert
import Web.Alert.Renderer.Common

-- | Render alerts using Bootstrap v3.x alerts
renderAlertsBootstrap3 :: [(AlertStatus, Text)] -> Text
renderAlertsBootstrap3 = renderAlerts "alert" (Just roleAttr) bootstrap3Clases

roleAttr :: Attribute
roleAttr = customAttribute "role" "alert"

bootstrap3Clases :: AlertStatus -> AttributeValue
bootstrap3Clases Default = "alert-default"
bootstrap3Clases Info = "alert-info"
bootstrap3Clases Success = "alert-success"
bootstrap3Clases Warning = "alert-warning"
bootstrap3Clases Error = "alert-danger"
