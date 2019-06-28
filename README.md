# alerts

Generate Alerts for web applications

```haskell
alert1 = Alert Success "Yay!"
alert2 = Alert Error "Oops!"

html1 = renderAlertsBootstrap3  [alert1, alert2]
html2 = renderAlertsBootstrap4  [alert1, alert2]
html3 = renderAlertsFoundation5 Round [alert1, alert2]
html3 = renderAlertsBulma       [alert1, alert2]
```
