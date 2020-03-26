//
//  FacetimeUITests.swift
//  FacetimeUITests
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import FacetimeUI

class FacetimeUITests: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

// MARK: View Controllers UITests
    func testCallViewController() {
        let sut = CallViewController()
        assertSnapshot(matching: sut, as: .image)
    }

// MARK: Components UITests
    func testPrintIcon() {
        let rootView = CallViewController()
        let sut = PrintButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60), in: rootView.view)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testMuteIcon() {
        let sut = Icon(frame: CGRect(x: 0, y: 0, width: 100, height: 120),type: .mute)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testMuteIconActive() {
        let sut = Icon(frame: CGRect(x: 0, y: 0, width: 100, height: 120),type: .mute)
        sut.tapped()
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testEffectsIcon() {
        let sut = Icon(frame: CGRect(x: 0, y: 0, width: 100, height: 120),type: .effects)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testEffectsIconActive() {
        let sut = Icon(frame: CGRect(x: 0, y: 0, width: 100, height: 120),type: .effects)
        sut.tapped()
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testTurnCameraIcon() {
        let sut = Icon(frame: CGRect(x: 0, y: 0, width: 100, height: 120),type: .turnCamera)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testTurnCameraIconActive() {
        let sut = Icon(frame: CGRect(x: 0, y: 0, width: 100, height: 120),type: .turnCamera)
        sut.tapped()
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testTurnOffIcon() {
        let sut = Icon(frame: CGRect(x: 0, y: 0, width: 100, height: 120),type: .turnOff)
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testControllsView() {
        let sut = ControllsView(frame: CGRect(x: 0, y: 0, width: 472, height: 200))
        assertSnapshot(matching: sut, as: .image)
    }

}
