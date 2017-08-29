module Web.Alert.Renderer.Bootstrap3 where

bootstrap3Clases :: AlertStatus -> AttributeValue
bootstrap3Clases Default = "alert-default"
bootstrap3Clases Info = "alert-info"
bootstrap3Clases Success = "alert-success"
bootstrap3Clases Warning = "alert-warning"
bootstrap3Clases Error = "alert-danger"
