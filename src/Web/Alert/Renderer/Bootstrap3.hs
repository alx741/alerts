{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Bootstrap3 where

import Data.Text.Lazy hiding (pack)
import Text.Blaze.Html

import Web.Alert
import Web.Alert.Renderer.Common

renderAlertsBootstrap3 :: [(AlertStatus, Text)] -> Text
renderAlertsBootstrap3 = renderAlerts "alert" bootstrap3Clases

bootstrap3Clases :: AlertStatus -> AttributeValue
bootstrap3Clases Default = "alert-default"
bootstrap3Clases Info = "alert-info"
bootstrap3Clases Success = "alert-success"
bootstrap3Clases Warning = "alert-warning"
bootstrap3Clases Error = "alert-danger"
bootstrap3Clases _ = "alert-default"
