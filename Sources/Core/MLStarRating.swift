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

class MLStarRating: UIView {
    
    static let name = "MLStarRating"
    
    private let star1 = StarButton()
    private let star2 = StarButton()
    private let star3 = StarButton()
    private let star4 = StarButton()
    private let star5 = StarButton()
    private var buttons: [StarButton] = []
    private var stackViewStar: UIStackView!
    var didChangeStar: ((_ startCount: Int) -> Void)?
    var selectedStar = 0
    init() {
        super.init(frame: .zero)
        setupStackView()
        setupViewConfiguration()
    }
    init(with star: Int) {
        super.init(frame: .zero)
        setupStackView()
        setupViewConfiguration()
    }
    private func setupStackView() {
        buttons = [star1, star2, star3, star4, star5]
        stackViewStar = UIStackView(arrangedSubviews: buttons)
        stackViewStar.axis = .horizontal
        stackViewStar.distribution = .fillEqually
        stackViewStar.alignment = UIStackViewAlignment.fill
        stackViewStar.spacing = 10
        stackViewStar.clipsToBounds = true
        stackViewStar.translatesAutoresizingMaskIntoConstraints = false
        setupActionsStar()
        changeButtons()
    }
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
    private func changeButtons() {
        clearAllStars()
        if selectedStar > 0{
            for i in 0..<selectedStar {
                buttons[i].viewState = .checked
            }
        }
    }
    private func clearAllStars() {
        for button in buttons {
            button.viewState = .unChecked
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//
//extension MLStarRating: ViewConfiguration {
//    func setupConstraints() {
//        widthAnchor.constraint(equalToConstant: 230).isActive = true
//        heightAnchor.constraint(equalToConstant: 36).isActive = true
//        stackViewStar.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        stackViewStar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        stackViewStar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//    }
//    func buildViewHierarchy() {
//        addSubview(stackViewStar)
//    }
//    func configureViews() {
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//}
