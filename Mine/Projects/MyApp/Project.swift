//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by apple on 2023/05/19.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "MyApp"
private let bundleID = "kr.dy.sample.MyApp"
private let iOSTargetVersion = "13.0"
private let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString" : "1.0",
    "CFBundleVersion" : "1"
]

let proejct = Project.app(
    name: projectName,
    product: .app,
    platform: .iOS,
    bundleID: bundleID,
    iOSTargetVersion: iOSTargetVersion,
    dependencies: [
      .project(target: "MyFramework", path: .relativeToManifest("../MyFramework")),
      .project(target: "Home", path: .relativeToCurrentFile("../Home")),
      .project(target: "MyPage", path: .relativeToCurrentFile("../MyPage"))
    ],
    infoPlist: infoPlist
)
