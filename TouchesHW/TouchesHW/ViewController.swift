//
//  ViewController.swift
//  TouchesHW
//
//  Created by Константин Евсюков on 25.01.2023.
//

/*
 Вот такой вот урок по тачам. Решил жесты и тачи в один урок не объединять, а относительно простой функционал тачей решил дополнить практическим примером.
 Уровень супермен (остальных уровней не будет):
 1. Создайте шахматное поле (8х8), используйте черные сабвьюхи.
 2. Добавьте балые и красные шашки на черные клетки (используйте начальное расположение в шашках).
 3. Реализуйте механизм драг'н'дроп подобно тому, что я сделал в примере, но с условиями:
 4. Шашки должны ставать в центр черных клеток.
 5. Даже если я отпустил шашку над центром белой клетки – она должна переместиться в центр ближайшей к отпусканию черной клетки.
 6. Шашки не могут становиться друг на друга.
 7. Шашки не могут быть поставлены за пределы поля.
 Вот такое вот веселое практическое задание.
 */

import UIKit

class ViewController: UIViewController {

    private let background = UIView()
    private let board = UIView()
    
    private var cells = [UIView]()
    private var checkers = [UIView]()
    private var draggingView = UIView()
    
    private var cellsPositions: [Int: CGPoint] = [:]
    private var checkersPositions: [Int: CGPoint] = [:]

    private var offsetX: CGFloat = 0
    private var offsetY: CGFloat = 0
    
    private var lastPosition = CGPoint()
    
    private lazy var backgroundSide = min(view.frame.height, view.frame.width)
    private lazy var cellSide = board.frame.height / 8
    private lazy var checkerSide = board.frame.height / 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
        configureSubviews()
        createCells()
        addChecker()
    }
}

// MARK: Touches
extension ViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let hitTestView = self.view.hitTest(touchOnMainView(touches), with: event)
        guard let hitTestResult = hitTestView else { return }
        
        checkers
            .forEach {
                if $0 == hitTestResult {
                    draggingView = hitTestResult
                    offsetX = draggingView.frame.width / 2 - touchOnDraggingView(touches).x
                    offsetY = draggingView.frame.height / 2 - touchOnDraggingView(touches).y
                }
            }
        
        lastPosition = draggingView.center
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        draggingView.center = CGPoint(x: touchOnBoard(touches).x + offsetX, y: touchOnBoard(touches).y + offsetY)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let diffBetweenPoints = cellsPositions
            .reduce(into: [Int: CGPoint]()) {
                let diffX = $1.value.x - touchOnBoard(touches).x
                let diffY = $1.value.y - touchOnBoard(touches).y
                let diffPoint = CGPoint(x: diffX, y: diffY)
                $0[$1.key] = diffPoint
            }
        
        let moduledDiffPoints = diffBetweenPoints.mapValues { (abs($0.x), abs($0.y)) }
        let sumFloats = moduledDiffPoints.mapValues { $0 + $1 }
        let keyWithMinSum = sumFloats.min { $0.value < $1.value }
        let numOfPosition = keyWithMinSum?.key ?? 0
        
        draggingView.center = cellsPositions[numOfPosition] ?? CGPoint(x: 0, y: 0)
        checkers.forEach{ checkersPositions[$0.tag] = $0.center }
        
        let setOfCheckers = Set(Array(checkersPositions.values).map { $0.dictionaryRepresentation })
        if setOfCheckers.count != checkers.count { draggingView.center = lastPosition }
        
        draggingView = UIView()
    }
}

// MARK: Helpers for touches
private extension ViewController {

    func touchOnMainView(_ touches: Set<UITouch>) -> CGPoint {
        let touch = touches.randomElement()
        guard let unwrappedTouch = touch else { return CGPoint(x: 0, y: 0) }
        let touchOnMainView = unwrappedTouch.location(in: self.view)
        return touchOnMainView
    }
    
    func touchOnBoard(_ touches: Set<UITouch>) -> CGPoint {
        let touch = touches.randomElement()
        guard let unwrappedTouch = touch else { return CGPoint(x: 0, y: 0) }
        let touchOnBoard = unwrappedTouch.location(in: board)
        return touchOnBoard
    }
    
    func touchOnDraggingView(_ touches: Set<UITouch>) -> CGPoint {
        let touch = touches.randomElement()
        guard let unwrappedTouch = touch else { return CGPoint(x: 0, y: 0) }
        return unwrappedTouch.location(in: draggingView)
    }
}

// MARK: Configuration
private extension ViewController {

    func addSubviews() {
        view.addSubview(background)
        background.addSubview(board)
    }

    func makeConstraints() {
        background.translatesAutoresizingMaskIntoConstraints = false
        board.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            background.widthAnchor.constraint(equalToConstant: backgroundSide),
            background.heightAnchor.constraint(equalToConstant: backgroundSide),
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            board.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
            board.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10),
            board.leftAnchor.constraint(equalTo: background.leftAnchor, constant: 10),
            board.rightAnchor.constraint(equalTo: background.rightAnchor, constant: -10)
        ])
    }

    func configureSubviews() {
        background.backgroundColor = .brown
        board.backgroundColor = .white
    }
}

// MARK: Creation cells and checkers
private extension ViewController {
    
    func createCells() {
        view.layoutIfNeeded()
        (0...31)
            .forEach { i in
                let coordX = calcCoordX(i: i, side: cellSide)
                let coordY = calcCoordY(i: i, side: cellSide)
                let origin = CGPoint(x: coordX, y: coordY)
                let size = CGSize(width: cellSide, height: cellSide)
                let cell = UIView(frame: CGRect(origin: origin, size: size))
                cell.backgroundColor = .black
                board.addSubview(cell)
                cellsPositions[i] = cell.center
            }
    }
    
    func addChecker() {
        (0...23).forEach { i in
            let checker = UIView()
            checker.tag = i
            checker.frame.size = CGSize(width: checkerSide, height: checkerSide)
            checker.layer.cornerRadius = checkerSide / 2
            checker.backgroundColor = i < 12 ? .red : .blue
            
            let index = i < 12 ? i : i + 8
            if let position = cellsPositions[index] {
                checker.center = position
                checkersPositions[i] = checker.center
            }
            board.addSubview(checker)
            checkers.append(checker)
        }
    }
}

// MARK: Calc coordinates
private extension ViewController {
    
    func calcCoordX(i: Int, side: CGFloat) -> CGFloat {
        var multiplierX: CGFloat = 0
        switch i % 8 {
        case 0:  multiplierX = 1
        case 1:  multiplierX = 3
        case 2:  multiplierX = 5
        case 3:  multiplierX = 7
        case 4:  multiplierX = 0
        case 5:  multiplierX = 2
        case 6:  multiplierX = 4
        case 7:  multiplierX = 6
        default: break
        }
        return multiplierX * side
    }

    func calcCoordY(i: Int, side: CGFloat) -> CGFloat {
        return CGFloat(i / 4) * side
    }
}

