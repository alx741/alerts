{-# LANGUAGE OverloadedStrings #-}

-- | Render 'Alert's using Foundation v5.x
--
--  Dependencies (These should be accessible in your app):
--
-- * Foundation's CSS and JS
--
-- * Modernizr
--
-- * JQuery

module Web.Alert.Renderer.Foundation5
    ( renderAlertsFoundation5
    , AlertType(..)
    ) where

import           Data.Text.Lazy
import           Text.Blaze.Html
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A

import Web.Alert
import Web.Alert.Renderer.Common

-- | Render alerts using Foundation v5.x alerts
renderAlertsFoundation5 :: AlertType -> [Alert] -> Text
renderAlertsFoundation5 atype = renderAlerts
    "alert-box"
    [alertTypeClass atype]
    (Just $ dataAttribute "alert" "")
    (Just close)
    foundation5Clases

-- | Foundation 5.x alert type
data AlertType
    = Radius -- ^ Slightly rounded corners
    | Round -- ^ Fully rounded corners
    deriving (Eq, Show, Read)

close :: Html
close =
    H.button
    ! A.class_ "close"
    ! customAttribute "aria-label" "x"
    $ preEscapedToHtml ("&times;" :: Text)


alertTypeClass :: AlertType -> AttributeValue
alertTypeClass Radius = "radius"
alertTypeClass Round  = "round"

foundation5Clases :: AlertStatus -> AttributeValue
foundation5Clases Default = "secondary"
foundation5Clases Info    = "info"
foundation5Clases Success = "success"
foundation5Clases Warning = "warning"
foundation5Clases Error   = "alert"
