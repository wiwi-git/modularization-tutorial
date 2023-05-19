import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains MyApp App target and MyApp unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin") // 넌 뭐냐 애는 설명이 왜 없냐

// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "MyApp",
//                          platform: .iOS,
//                          additionalTargets: ["MyAppKit", "MyAppUI"])

let projectName = "MyApp"
let bundleID = "kr.dy.sample.MyApp"
let iOSTargetVersion = "13.0"

/* -- Proejct init --
 public init(name: String, organizationName: String? = nil, options: ProjectDescription.Project.Options = .options(), packages: [ProjectDescription.Package] = [], settings: ProjectDescription.Settings? = nil, targets: [ProjectDescription.Target] = [], schemes: [ProjectDescription.Scheme] = [], fileHeaderTemplate: ProjectDescription.FileHeaderTemplate? = nil, additionalFiles: [ProjectDescription.FileElement] = [], resourceSynthesizers: [ProjectDescription.ResourceSynthesizer] = .default)
 */
let project = Project(name: projectName,
                      organizationName: "wiwi",
                      packages: [],// SPM 사용 시 입력 ".package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0")"
                      settings: nil,// configuration으로 관리할 경우 아래처럼 path정보 입력
                      //  settings: .settings(configurations: [
                      //    .debug(name: "Debug", xcconfig: .relativeToRoot("Confiugrations/\(projectName)-Debog.xcconfg")),
                      //    .debug(name: "Release", xcconfig: "Confiugrations/\(projectName)-Release.xcconfg"),
                      //  ]),
                      targets: [
                        Target(name: projectName,
                               platform: .iOS,
                               product: .staticFramework,
                               bundleId: bundleID,
                               deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone, .ipad]),
                               infoPlist: .default,
                               sources: ["Targets/\(projectName)/Sources/**"],
                               resources: [],
                               dependencies: [] // tuist generate할 경우 pod install이 자동으로 실행
                              )
                      ],
                      schemes: [
                        Scheme(name: "\(projectName)-Debug"),
                        Scheme(name: "\(projectName)-Release")
                      ],
                      fileHeaderTemplate: nil,
                      additionalFiles: [],
                      resourceSynthesizers: []
)

