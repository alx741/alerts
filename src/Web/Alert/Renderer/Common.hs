{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Common
    ( renderAlerts
    ) where

import Data.Maybe

import Data.Text.Lazy
import Text.Blaze.Html
import Text.Blaze.Html.Renderer.Text
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

import Web.Alert

renderAlerts
    :: AttributeValue
    -> [AttributeValue]
    -> Maybe Attribute
    -> (AlertStatus -> AttributeValue)
    -> [(AlertStatus, Text)]
    -> Text
renderAlerts _ _ _ _ [] = mempty
renderAlerts baseClass extraClass mAttr clases msgs = renderHtml $ foldMap makeDivs msgs
    where
        attr = fromMaybe mempty mAttr
        makeDivs (stat, msg) =
            H.div
            ! A.class_ baseClass
            ! A.class_ (clases stat)
            ! foldMap A.class_ extraClass
            ! attr
            $ toHtml msg
