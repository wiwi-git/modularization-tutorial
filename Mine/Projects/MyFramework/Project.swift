//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by apple on 2023/05/19.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "MyFramework"
private let bundleID = "kr.dy.sample.MyFramework"
private let iOSTargetVersion = "13.0"
/*
let project = Project.app(
  name: projectName,
  product: .staticFramework,
  platform: .iOS,
  bundleID: bundleID,
  dependencies: []
)
*/
let project = Project.framework(
    name: projectName,
    platform: .iOS,
    bundleID: bundleID,
    iOSTargetVersion: iOSTargetVersion,
    dependencies: [ ])
