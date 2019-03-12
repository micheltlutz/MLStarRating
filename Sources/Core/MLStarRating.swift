////MIT License
////
////Copyright (c) 2018 Michel Anderson Lüz Teixeira
////
////Permission is hereby granted, free of charge, to any person obtaining a copy
////of this software and associated documentation files (the "Software"), to deal
////in the Software without restriction, including without limitation the rights
////to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
////copies of the Software, and to permit persons to whom the Software is
////furnished to do so, subject to the following conditions:
////
////The above copyright notice and this permission notice shall be included in all
////copies or substantial portions of the Software.
////
////THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
////IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
////FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
////AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
////LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
////OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
////SOFTWARE.

import UIKit

/**
 MLStarRating
 */
open class MLStarRating: UIView {
    static let name = "MLStarRating"
    /**
     Image Name for unchecked state component
     */
    open var emptyStarImageName: String?
    /**
     Image Name for checked state component
     */
    open var fullStarImageName: String?
    /**
     Define star1: MLStarButton
     */
    private let star1 = MLStarButton()
    /**
     Define star2: MLStarButton
     */
    private let star2 = MLStarButton()
    /**
     Define star3: MLStarButton
     */
    private let star3 = MLStarButton()
    /**
     Define star4: MLStarButton
     */
    private let star4 = MLStarButton()
    /**
     Define star5: MLStarButton
     */
    private let star5 = MLStarButton()
    /**
     Define a empty array of MLStarButton
     */
    private var buttons: [MLStarButton] = []
    /**
     Define stackViewStar: UIStackView
     */
    private var stackViewStar: UIStackView!
    /**
     Handler called when check or uncheck star
     */
    open var didChangeStar: ((_ startCount: Int) -> Void)?
    /**
     store value of selected star default value = 0
     */
    open var selectedStar = 0 {
        didSet {
            changeButtons()
        }
    }

    /**
     Default Initializar with empty stars
     */
    public init() {
        super.init(frame: .zero)
        setupStars()
        setupStackView()
        setupViewConfiguration()
    }
    /**
     Initializer with star checked

     - Parameters:
     - with star: Int value started
     */
    public init(with star: Int) {
        super.init(frame: .zero)
        selectedStar = star
        setupStackView()
        setupStars()
        setupViewConfiguration()
        changeButtons()
    }
    /**
     Call this function when you change the images names self emptyStarImageName or fullStarImageName, this function change images on star(n): MLStarButton

     - SeeAlso: `MLStarButton`
     */
    open func setupStars() {
        if let emptyStarImageName = emptyStarImageName {
            star1.emptyStarImageName = emptyStarImageName
            star2.emptyStarImageName = emptyStarImageName
            star3.emptyStarImageName = emptyStarImageName
            star4.emptyStarImageName = emptyStarImageName
            star5.emptyStarImageName = emptyStarImageName
        }
        
        if let fullStarImageName = fullStarImageName {
            star1.fullStarImageName = fullStarImageName
            star2.fullStarImageName = fullStarImageName
            star3.fullStarImageName = fullStarImageName
            star4.fullStarImageName = fullStarImageName
            star5.fullStarImageName = fullStarImageName
        }
    }
    /**
     Initializar and configure a UIStackView with stars and call setupactions and check buttons if initializer
     */
    private func setupStackView() {
        buttons = [star1, star2, star3, star4, star5]
        stackViewStar = UIStackView(arrangedSubviews: buttons)
        stackViewStar.axis = .horizontal
        stackViewStar.distribution = .fillEqually
        stackViewStar.alignment = .fill
        stackViewStar.spacing = 10
        stackViewStar.translatesAutoresizingMaskIntoConstraints = false
        setupActionsStar()
        changeButtons()
    }
    /**
     Setup actions and values of all stars
     */
    private func setupActionsStar() {
        star1.addAction {
            self.selectedStar = 1
            self.changeButtons()
            self.didChangeStar?(self.selectedStar)
        }
        star2.addAction {
            self.selectedStar = 2
            self.changeButtons()
            self.didChangeStar?(self.selectedStar)
        }
        star3.addAction {
            self.selectedStar = 3
            self.changeButtons()
            self.didChangeStar?(self.selectedStar)
        }
        star4.addAction {
            self.selectedStar = 4
            self.changeButtons()
            self.didChangeStar?(self.selectedStar)
        }
        star5.addAction {
            self.selectedStar = 5
            self.changeButtons()
            self.didChangeStar?(self.selectedStar)
        }
    }
    /**
     Change all stars to state .unChecked and check stars selecteds
     */
    private func changeButtons() {
        clearAllStars()
        if selectedStar > 0 && selectedStar <= 5 {
            for i in 0..<selectedStar {
                buttons[i].viewState = .checked
            }
        }
    }
    /**
     Change all stars to state .unChecked
     */
    private func clearAllStars() {
        for button in buttons {
            button.viewState = .unChecked
        }
    }
    /**
     :nodoc:
     */
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/**
 Implementing MLViewConfiguration

 - SeeAlso: `MLViewConfiguration`
 */
extension MLStarRating: MLViewConfiguration {
    /**
     :nodoc:
     */
    func setupConstraints() {
        widthAnchor.constraint(equalToConstant: 230).isActive = true
        heightAnchor.constraint(equalToConstant: 36).isActive = true
        stackViewStar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackViewStar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    /**
     :nodoc:
     */
    func buildViewHierarchy() {
        addSubview(stackViewStar)
    }
    /**
     :nodoc:
     */
    func configureViews() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
