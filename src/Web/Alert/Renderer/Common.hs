{-# LANGUAGE OverloadedStrings #-}

module Web.Alert.Renderer.Common where

import Data.String
import Data.Text.Lazy hiding (pack)

import Text.Blaze.Html
import Text.Blaze.Html.Renderer.Text
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

import Web.Alert

renderAlerts :: AttributeValue -> (AlertStatus -> AttributeValue) -> [(AlertStatus, Text)] -> Text
renderAlerts _ _ [] = mempty
renderAlerts baseClass clases msgs = renderHtml $ foldMap makeDivs msgs
    where
        makeDivs (stat, msg) =
            H.div
            ! A.class_ baseClass
            ! A.class_ (clases stat)
            $ toHtml msg
    -- foldMap (\(stat, msg) -> H.div ! A.class_ baseClass ! A.class_ (clases stat) $ msg) msgs

dummyClases :: AlertStatus -> AttributeValue
dummyClases _ = ""
