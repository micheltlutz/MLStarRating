//
//  MLStarRatingSpec.swift
//  MLStarRating
//
//  Created by Michel Anderson Lutz Teixeira on 04/10/16.
//  Copyright © 2017 micheltlutz. All rights reserved.
//

import Quick
import Nimble
@testable import MLStarRating

class MLStarRatingSpec: QuickSpec {

    override func spec() {

        describe("MLStarRatingSpec") {
            it("works") {
                expect(MLStarRating.name) == "MLStarRating"
            }
        }

    }

}
