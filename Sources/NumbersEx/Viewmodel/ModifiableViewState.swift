//
//  ModifiableViewState.swift
//  Numbers
//
//  Created by Michel Goñi on 30/12/22.
//

import Combine

@available(iOS 13.0, *)
public class ModifiableViewState<ViewState> {
    lazy var state = { PassthroughSubject<ViewState?, Never>() }()

    public init() {}
}
@available(iOS 13.0, *)
public protocol ModifiableStateData {
    associatedtype ViewState
    var modifiableView: ModifiableViewState<ViewState> { get }
}
@available(iOS 13.0, *)
public extension ModifiableStateData {
    var viewState: PassthroughSubject<ViewState?, Never> {
        get { modifiableView.state }
        set { modifiableView.state = newValue }
    }
}

