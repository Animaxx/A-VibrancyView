# A-VibrancyView
A derived UIView to let you custom the Blur and Transparence effect

> Simulator may not present correctly, if so, please use real device to test it.

### Base vibrancy view
![recording demo](https://raw.githubusercontent.com/Animaxx/A-VibrancyView/master/DemoGif/baseVibrancy_demo.gif)

#### Code Example for base vibrancy view

> For base usage, `A_VibrancyView.swift` is your only needed.

```Swift
vibrancyView.presentEffect() //Dispaly Light blur style with 0.5 second animation
vibrancyView.presentEffect(.Dark, animationDuration: 0) //Dsipaly Dark blur style with no fade aniamtion
vibrancyView.convertAllSubview()  // Convert all subview to cut-out transparent
vibrancyView.recoverAllSubview()  // Recovert all cut-out transparent in this vibrancy view
vibrancyView.alphaOfEffect = 0.1  // Set alpha of blur effect layer 
```

### Advanced vibrancy view
![recording demo](https://raw.githubusercontent.com/Animaxx/A-VibrancyView/master/DemoGif/advancedVibranct_demo.gif)

> - Note: Advanced version is experimental project, there is no guarantee it can pass the apple review.
> - For advanced usage, please add `A_AdvancedVibrancyView.h` and `A_AdvancedVibrancyView.m` files to your project.

```Swift
vibrancyView.presentEffect() //Dispaly Light blur style with 0.5 second animation
vibrancyView.presentEffectWithoutAnimation(.Dark) //Dsipaly Dark blur style with no fade aniamtion
vibrancyView.blurRadius = 5.0  // Set blur radius for effect view
vibrancyView.grayscaleTintAlpha = 0.1 // Set attached color alpha
vibrancyView.grayscaleTintLevel = 0.8 // Set attached color 0 means black, 1.0 means white
```



