{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Common
    ( renderAlerts
    ) where

import Data.Maybe

import Data.Text.Lazy
import Data.Monoid
import Text.Blaze.Html
import Text.Blaze.Html.Renderer.Text
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

import Web.Alert

renderAlerts
    :: AttributeValue
    -> [AttributeValue]
    -> Maybe Attribute
    -> Maybe Html
    -> (AlertStatus -> AttributeValue)
    -> [(AlertStatus, Text)]
    -> Text
renderAlerts _ _ _ _ _ [] = mempty
renderAlerts baseClass extraClass mAttr mInternal clases msgs =
    renderHtml $ foldMap makeDivs msgs
    where
        attr = fromMaybe mempty mAttr
        internal = fromMaybe mempty mInternal
        makeDivs (stat, msg) =
            H.div
            ! attr
            ! A.class_ baseClass
            ! A.class_ (clases stat)
            ! foldMap A.class_ extraClass
            $ internal <> (toHtml msg)
