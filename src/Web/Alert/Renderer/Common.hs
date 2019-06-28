{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Common
    ( renderAlerts
    ) where

import Data.Maybe

import           Data.Foldable                 (fold)
import           Data.List                     (intersperse)
import           Data.Text.Lazy                hiding (intersperse)
import           Text.Blaze.Html
import           Text.Blaze.Html.Renderer.Text
import qualified Text.Blaze.Html5              as H
import qualified Text.Blaze.Html5.Attributes   as A

import Web.Alert

renderAlerts
 :: AttributeValue
 -> [AttributeValue]
 -> Maybe Attribute
 -> Maybe Html
 -> (AlertStatus -> AttributeValue)
 -> [Alert]
 -> Text
renderAlerts _ _ _ _ _ [] = mempty
renderAlerts baseClass extraClass mAttr mInternal clases msgs =
    renderHtml $ foldMap makeDivs msgs
    where
        attr = fromMaybe mempty mAttr
        internal = fromMaybe mempty mInternal
        extras = fold $ intersperse " " extraClass
        makeDivs (Alert stat msg) =
            H.div
            ! attr
            ! A.class_ (baseClass <> " " <> (clases stat) <> " " <> extras)
            $ internal <> (toHtml msg)
