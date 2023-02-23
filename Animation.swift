func circleAnimation(with center: CGPoint) {
        
        let circleView = UIView(frame: CGRect(x: center.x - 125, y: center.y - 125, width: 250, height: 250))
        
        // Create a circular path for the circle view
        let circlePath = UIBezierPath()
        let center = CGPoint(x: circleView.bounds.midX, y: circleView.bounds.midY) // center of the circle
        let outerRadius: CGFloat = 120
        let innerRadius: CGFloat = 24
        
        // Draw outer circle
        circlePath.addArc(withCenter: CGPoint(x: center.x, y: center.y), radius: outerRadius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        // Draw inner circle (hole)
        circlePath.move(to: CGPoint(x: center.x + innerRadius, y: center.y))
        circlePath.addArc(withCenter: CGPoint(x: circleView.bounds.midX, y: circleView.bounds.midY), radius: innerRadius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        // Create a shape layer with the circular path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillRule = .evenOdd
        
        // Set the background color of the circle view
        circleView.backgroundColor = UIColor.clear
        
        // Add the shape layer to the circle view
        circleView.layer.mask = shapeLayer
        
        // Create a conical gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .conic
        gradientLayer.colors = [UIColor(red: 149/255, green: 188/255, blue: 255/255, alpha: 0.5).cgColor, UIColor.white.withAlphaComponent(0.01).cgColor, UIColor.white.withAlphaComponent(0.01).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = circleView.bounds
        
        // Add the gradient layer to the circle view
        circleView.layer.addSublayer(gradientLayer)
        
        // Create rotate animation
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = -CGFloat.pi / 2
        animation.toValue = (CGFloat.pi / 2) * 3
        animation.duration = 5 // 5 seconds for a full rotation
        animation.repeatCount = .ulpOfOne // Repeat indefinitely
        
        // Add animation to circle view
        circleView.layer.add(animation, forKey: "rotationAnimation")
        
        // Create border for circle view
        let borderLayer = CAShapeLayer()
        borderLayer.path = circlePath.cgPath
        borderLayer.lineWidth = 1.5
        borderLayer.strokeColor = UIColor(red: 163/255, green: 196/255, blue: 255/255, alpha: 0.3).cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        
        // Add border to circle view
        circleView.layer.addSublayer(borderLayer)
        
        // Add the circle view to the view controller's view
        view.addSubview(circleView)
    }
