# A-VibrancyView
A derived UIView to let you custom the Blur and Transparence effect

> Simulator may not present correctly, if so, please use real device to test it.

### Base vibrancy view
![recording demo](https://raw.githubusercontent.com/Animaxx/A-VibrancyView/master/DemoGif/baseVibrancy_demo.gif)

#### Code Example for base vibrancy view
```Swift
vibrancyView.presentEffect() //Dispaly Light blur style with 0.5 second animation
vibrancyView.presentEffect(.Dark, animationDuration: 0) //Dsipaly Dark blur style with no fade aniamtion
vibrancyView.convertAllSubview()  // Convert all subview to cut-out transparent
vibrancyView.recoverAllSubview()  // Recovert all cut-out transparent in this vibrancy view
vibrancyView.alphaOfEffect = 0.1  // Set alpha of blur effect layer 
```

