//
//  ViewController.swift
//  AutoLayout_DZ
//
//  Created by newuser on 21.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstLabel: UILabel = {
        
        let labelFirst = UILabel(frame: .zero)
        labelFirst.translatesAutoresizingMaskIntoConstraints = false
        labelFirst.text = "Rick Sanchez"
        labelFirst.textAlignment = .center
        labelFirst.backgroundColor = UIColor.green
        labelFirst.tintColor = UIColor.black
        
        labelFirst.setContentHuggingPriority(.init(rawValue:810), for: .horizontal)
        labelFirst.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        
        return labelFirst
    }()
    
    private lazy var secondLabel: UILabel = {
        
        let labelSecond = UILabel(frame: .zero)
        labelSecond.translatesAutoresizingMaskIntoConstraints = false
        labelSecond.text = "Morty"
        labelSecond.textAlignment = .center
        labelSecond.backgroundColor = UIColor.yellow
        labelSecond.tintColor = UIColor.black
        
        labelSecond.setContentHuggingPriority(.init(rawValue:80), for: .horizontal)
        labelSecond.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        return labelSecond
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ident = self.view.frame.height/10
    private lazy var identForPicture = ident > 10 ? -10: ident
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView.init(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        
        return stack
    }()
    
    private lazy var constraintForPortarit: [NSLayoutConstraint] = [
        
        secondLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        secondLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
        secondLabel.leadingAnchor.constraint(equalTo: self.firstLabel.trailingAnchor, constant: 0),
        
        firstLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        firstLabel.trailingAnchor.constraint(equalTo: self.secondLabel.leadingAnchor, constant:  0),
        firstLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
        
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        imageView.widthAnchor.constraint(equalToConstant: 200),
        imageView.heightAnchor.constraint(equalToConstant: 200),
        imageView.bottomAnchor.constraint(equalTo: self.secondLabel.topAnchor, constant: identForPicture)
        
    ]
    
    private lazy var constraintForLanscape: [NSLayoutConstraint] = [
        imageView.heightAnchor.constraint(equalToConstant: 200),
        imageView.widthAnchor.constraint(equalToConstant: 200),
        
//        FirstLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//        FirstLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
//        FirstLabel.trailingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 10),
//
//        SecondLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//        SecondLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
//        SecondLabel.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 10)
//
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant:  -20),

        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)
        
    ]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(stackView)
        self.setupConstraint()

//        self.view.addSubview(FirstLabel)
//        self.view.addSubview(SecondLabel)
//        self.view.addSubview(imageView)
//        NSLayoutConstraint.activate(constraintForPortarit)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.setupConstraint()
        }
    
    private func setupConstraint() {

        if UIDevice.current.orientation.isLandscape {
            
            self.firstLabel.removeFromSuperview()
            self.secondLabel.removeFromSuperview()
            self.imageView.removeFromSuperview()
            

           
            self.stackView.addArrangedSubview(firstLabel)
            self.stackView.addArrangedSubview(imageView)
            self.stackView.addArrangedSubview(secondLabel)

            
            NSLayoutConstraint.deactivate(constraintForPortarit)
            NSLayoutConstraint.activate(constraintForLanscape)
        } else {
            
            
            self.view.addSubview(imageView)
            self.view.addSubview(firstLabel)
            self.view.addSubview(secondLabel)
            
            self.stackView.removeArrangedSubview(firstLabel)
            self.stackView.removeArrangedSubview(secondLabel)
            self.stackView.removeArrangedSubview(imageView)

            


            NSLayoutConstraint.deactivate(constraintForLanscape)
            NSLayoutConstraint.activate(constraintForPortarit)
        }


    }
    
    
    }




