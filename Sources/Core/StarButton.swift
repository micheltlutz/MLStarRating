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

enum StarButtonState: String {
    case checked, unChecked
}
class StarButton: UIButton {
    var didCheck: (() -> Void)?
    var didUnChack: (() -> Void)?
    private let sizeIcon = CGFloat(36)
    var viewState: StarButtonState = .unChecked {
        didSet {
            if viewState == .unChecked {
                setImage(UIImage(named: "emptyStar"), for: .normal)
            } else {
                setImage(UIImage(named: "fullStar"), for: .normal)
            }
        }
    }
    init() {
        super.init(frame: .zero)
        addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StarButton {
    @objc fileprivate func touchUpInsideButton() {
        if viewState == .checked {
            didUnChack?()
        } else {
            didCheck?()
        }
    }
}
