{-# LANGUAGE OverloadedStrings #-}

-- | Render 'Alert's using Bootstrap v3.x
--
--  Dependencies (These should be accessible in your app):
--
-- * Bootstrap's CSS and JS
--
-- * JQuery >= 1.12.4

module Web.Alert.Renderer.Bootstrap3
    ( renderAlertsBootstrap3
    ) where

import           Data.Text.Lazy
import           Text.Blaze.Html
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A

import Web.Alert
import Web.Alert.Renderer.Common

-- | Render alerts using Bootstrap v3.x alerts
renderAlertsBootstrap3 :: [Alert] -> Text
renderAlertsBootstrap3 = renderAlerts
    "alert"
    []
    (Just $ customAttribute "role" "alert")
    (Just close)
    bootstrap3Clases

close :: Html
close =
    H.button
    ! A.class_ "close"
    ! A.type_ "button"
    ! dataAttribute "dismiss" "alert"
    ! customAttribute "aria-label" "x" $ do
        H.span ! customAttribute "aria-hidden" "true"
        $ preEscapedToHtml ("&times;" :: Text)

bootstrap3Clases :: AlertStatus -> AttributeValue
bootstrap3Clases Default = "alert-default"
bootstrap3Clases Info    = "alert-info"
bootstrap3Clases Success = "alert-success"
bootstrap3Clases Warning = "alert-warning"
bootstrap3Clases Error   = "alert-danger"
