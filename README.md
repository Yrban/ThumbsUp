# ThumbsUp
Entry for SwiftUI Series:  Animations

![Thumbs up animation that rotates down and snaps up releasing a balloon and confetti](https://github.com/Yrban/ThumbsUp/blob/main/Thumbs%20Up.gif)?raw=true)

This is a fun little animation. It starts quietly and then explodes in confetti and a balloon. Using a combination of animations and GoemetryAffects allows this whimsical animation to shine.

The animation starts with a simple gray thumbs up. A tap causes the thumb to slowly rotate down 45 degrees. It then snaps back with a very stiff spring effect. When the thumb snaps back, the confetti explosion occurs. The thumb simultaneously turns gold and a blue baloon is released with the current count. If the count is 0, then only the thumbs up will show. As soon as there is a count, the number is appended to the right of the thumbs up. This does not change the placement of the thumbs up.

The confetti is made by a GeometryEffect, with random speeds and direction. The GeometryEffect is applied through a ViewModifier that can modify the hue, scales the confetti from 0.1 to 1 with an animation, and causes the confetti to fade away with an animated opacity change. This is all bundled into an affine translation and applied to the view with a ProjectionTransform. The amount of confetti and duration of the effect is passed by variables through an extension on View.

At the same time, the balloon is released and floats rapidly out of the view. This is also set by a GeometryEffect that is a bit simpler than the confetti. The balloon simply floats up and out of the view, so I wanted a linearly animated movement, so the y value has no random component, as opposed to the x value which does have a slight random movement.

The whole animation is bounded by a .clipShape(Circle()) that prevents it from getting too out of control, though removing that would allow the confetti to spew across the screen, but in keeping micro interaction theme, I kept it contained...
