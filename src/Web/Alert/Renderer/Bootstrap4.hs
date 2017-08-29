{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Bootstrap4
    ( renderAlertsBootstrap4
    ) where

import Data.Text.Lazy
import Text.Blaze.Html
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

import Web.Alert
import Web.Alert.Renderer.Common

-- | Render alerts using Bootstrap v4.x alerts
renderAlertsBootstrap4 :: [Alert] -> Text
renderAlertsBootstrap4 = renderAlerts
    "alert"
    ["alert-dismissible", "fade", "show"]
    (Just $ customAttribute "role" "alert")
    (Just close)
    bootstrap4Clases

close :: Html
close =
    H.button
    ! A.class_ "close"
    ! A.type_ "button"
    ! dataAttribute "dismiss" "alert"
    ! customAttribute "aria-label" "x" $ do
        H.span ! customAttribute "aria-hidden" "true"
        $ preEscapedToHtml ("&times;" :: Text)


bootstrap4Clases :: AlertStatus -> AttributeValue
bootstrap4Clases Default = "alert-primary"
bootstrap4Clases Info = "alert-info"
bootstrap4Clases Success = "alert-success"
bootstrap4Clases Warning = "alert-warning"
bootstrap4Clases Error = "alert-danger"
