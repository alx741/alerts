{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Common where

import Data.Monoid ((<>))
import Data.Text.Lazy hiding (foldl)
import Text.Blaze.Html
import Text.Blaze.Html.Renderer.Text
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

import Web.Alert

renderAlerts :: (AlertStatus -> AttributeValue) -> [(AlertStatus, Html)] -> Text
renderAlerts clases [] = ""
renderAlerts clases msgs = renderHtml $
    foldMap (\(stat, msg) -> H.div ! A.class_ "alert" ! A.class_ (clases stat) $ msg) msgs
