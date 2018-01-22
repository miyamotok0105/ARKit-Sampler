//
//  SimpleViewController.swift
//  ARKit-Sampler
//
//  Created by Shuichi Tsutsumi on 2017/09/20.
//  Copyright © 2017 Shuichi Tsutsumi. All rights reserved.
//

//【基本クラス】
//ARSession
//...ar機能全体をセッションで管理する
//ARConfiguration
//...オーディオデータも取得するかなど設定をできる
//ARWorldTrackingConfiguration
//...デバイスの向きや位置をトラッキングし、面を検出するコンフィギュレーションをする。
//ARSCNView
//...arkitはコアな処理のみし、実際の描画はSceneKit や SpriteKit、Metal で行う。


import UIKit
//arkitをインポート
import ARKit

class SimpleViewController: UIViewController {

    //plistにカメラの権限を追加。
    
    //ARSCNViewを追加しストーリーボードと繋げる。
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scnをSCNSceneに紐づける
        sceneView.scene = SCNScene(named: "ship.scn", inDirectory: "models.scnassets/ship")!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //セッションのコンフィギュレーションしてセッションをスタート
        sceneView.session.run(ARWorldTrackingConfiguration())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //セッションの中断
        sceneView.session.pause()
    }
}
