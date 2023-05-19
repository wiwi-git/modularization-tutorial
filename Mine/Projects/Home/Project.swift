//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by apple on 2023/05/19.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "Home"
private let bundleID = "kr.dy.sample.Home"
private let iOSTargetVersion = "13.0"
private let infoPlist: [String: InfoPlist.Value] = [
    "UILaunchScreen": [:]
]

let project = Project.frameworkWithApp(
    name: projectName,
    platform: .iOS,
    bundleID: bundleID,
    iOSTargetVersion: iOSTargetVersion,
    dependencies: [.project(target: "MyFramework", path: .relativeToManifest("../MyFramework"))],
    infoPlist: infoPlist)
