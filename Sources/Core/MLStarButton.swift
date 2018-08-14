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

public enum MLStarButtonState: String {
    case checked, unChecked
}
public class MLStarButton: UIButton {
    open var didCheck: (() -> Void)?
    open var didUnChack: (() -> Void)?
    open var emptyStarImageName = "emptyStar" {
        didSet {
            setupImages()
        }
    }
    open var fullStarImageName = "fullStar" {
        didSet {
            setupImages()
        }
    }
    private let sizeIcon = CGFloat(36)
    open var viewState: MLStarButtonState = .unChecked {
        didSet {
            setupImages()
        }
    }
    convenience init() {
        self.init(frame: CGRect.zero)
        addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
    }
    internal func setupImages() {
        if viewState == .unChecked {
            setImage(UIImage(named: emptyStarImageName), for: .normal)
        } else {
            setImage(UIImage(named: fullStarImageName), for: .normal)
        }
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MLStarButton {
    @objc fileprivate func touchUpInsideButton() {
        if viewState == .checked {
            didUnChack?()
        } else {
            didCheck?()
        }
    }
}
