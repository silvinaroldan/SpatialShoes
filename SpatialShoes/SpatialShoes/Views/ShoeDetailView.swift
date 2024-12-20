//
//  ShoeDetail.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/08/2024.
//

import RealityKit
import SpatialShoesRC
import SwiftData
import SwiftUI

struct ShoeDetailView: View {
    let selectedShoe: ShoeModel
    
    @Environment(ShoesVM.self) private var shoesVM
    @Environment(\.modelContext) var context
    
    @Query private var favorites: [ShoeDataModel]
    
    @Binding var touch: Bool
    @Binding var rotate: Bool
    
    @State private var shoeIsFavorite = false
    
    @State private var initialScale: Double
    @State private var scaleMagnified: Double
    
    @State private var lastDragValue: CGSize = .zero
    @State private var velocity: CGSize = .zero
    @State private var rotationAngle: Double = 0.0
    @State private var currentRotationX: CGFloat = 0.0
    @State private var currentRotationY: CGFloat = 0.0
    
    init(selectedShoe: ShoeModel, touch: Binding<Bool>, rotate: Binding<Bool>) {
        self.selectedShoe = selectedShoe
        _touch = touch
        _rotate = rotate
        _scaleMagnified = State(initialValue: selectedShoe.scale)
        _initialScale = State(initialValue: selectedShoe.scale)
    }
    
    var body: some View {
        VStack {
            Model3D(named: selectedShoe.model3DName, bundle: spatialShoesRCBundle) { model in
                model
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scaleMagnified)
                    .offset(x: selectedShoe.offset.x, y: selectedShoe.offset.y)
                    .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: -1, z: 0))
                    .rotation3DEffect(.degrees(currentRotationX), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(currentRotationY), axis: (x: -1, y: 0, z: 0))
            } placeholder: {
                ProgressView()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let deltaX = value.translation.width - lastDragValue.width
                        let deltaY = value.translation.height - lastDragValue.height
                                       
                        velocity = CGSize(
                            width: deltaX / 10,
                            height: deltaY / 10
                        )
                        if touch {
                            lastDragValue = value.translation
                            
                            currentRotationY += velocity.height
                            currentRotationX += velocity.width
                        }
                    }
                    .onEnded { _ in
                        lastDragValue = .zero
                        if touch {
                            startInertia()
                        }
                    }
            )
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        let newScale = (value.magnification - 1.0) + initialScale
                        if newScale > selectedShoe.scale, newScale < 1.0 {
                            scaleMagnified = newScale
                        }
                    }
                    .onEnded { _ in
                        initialScale = scaleMagnified
                    }
            )
        }
        .onAppear {
            doRotation()
            shoeIsFavorite = favorites.contains(where: { $0.id == selectedShoe.id })
        }
        .onChange(of: selectedShoe) { _, _ in
            reset()
        }
        .onChange(of: favorites) {
            shoeIsFavorite = favorites.contains(where: { $0.id == selectedShoe.id })
        }
        .toolbar {
            Button(shoeIsFavorite ? "Remove as favorite" : "Add as favorite",
                   systemImage: shoeIsFavorite ? "star.fill" : "star") {
                try? shoesVM.toggleFavorite(shoe: selectedShoe,
                                             context: context)
            }
           
        }
    }
    
    func doRotation() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
            let angle = rotationAngle + 0.2
            if rotate {
                rotationAngle = rotationAngle < 360 ? angle : 0
            }
        }
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func startInertia() {
        let inertialTimer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { timer in
            if abs(velocity.width) < 0.01 || abs(velocity.height) < 0.01 {
                timer.invalidate()
            } else {
                velocity.width *= 0.95
                velocity.height *= 0.95
                currentRotationX += velocity.width
                currentRotationY += velocity.height
            }
        }
        RunLoop.current.add(inertialTimer, forMode: .common)
    }
    
    func reset() {
        scaleMagnified = selectedShoe.scale
        initialScale = selectedShoe.scale
        velocity = .zero
        lastDragValue = .zero
        rotationAngle = 0.0
        currentRotationX = 0.0
        currentRotationY = 0.0
        shoeIsFavorite = favorites.contains(where: { $0.id == selectedShoe.id })
    }

}

#Preview {
    ShoeDetailView(selectedShoe: .test, touch: .constant(true), rotate: .constant(true))
}
