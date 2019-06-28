{-# LANGUAGE OverloadedStrings #-}

-- | Render 'Alert's using Bulma
--
--  Dependencies (These should be accessible in your app):
--
-- * Bulma's CSS
--
-- * JQuery >= 3.2.1

module Web.Alert.Renderer.Bulma
    ( renderAlertsBulma
    ) where

import           Data.Text.Lazy
import           Text.Blaze.Html
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A

import Web.Alert
import Web.Alert.Renderer.Common

-- | Render alerts using Bulma notifications
renderAlertsBulma :: [Alert] -> Text
renderAlertsBulma = renderAlerts
    "notification"
    []
    Nothing
    (Just close)
    bulmaClases

close :: Html
close = H.button ! A.class_ "delete" $ ""

bulmaClases :: AlertStatus -> AttributeValue
bulmaClases Default = "is-primary"
bulmaClases Info    = "is-info"
bulmaClases Success = "is-success"
bulmaClases Warning = "is-warning"
bulmaClases Error   = "is-danger"
