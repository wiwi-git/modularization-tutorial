import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    /*
     public static func app(name: String, platform: Platform, additionalTargets: [String]) -> Project {
     var targets = makeAppTargets(name: name,
     platform: platform,
     dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
     targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, platform: platform) })
     return Project(name: name,
     organizationName: "tuist.io",
     targets: targets)
     }
     */
    public static func app(
        name: String,
        product: Product,
        platform: Platform,
        bundleID: String,
        iOSTargetVersion: String,
        dependencies: [TargetDependency] = [],
        infoPlist: [String: InfoPlist.Value] = [:]
    ) -> Project {
        let targets = self.makeAppTargets(name: name, platform: platform, bundleID: bundleID, iOSTargetVersion: iOSTargetVersion, infoPlist: infoPlist, dependencies: dependencies)
        return Project(name: name, targets: targets)
        /*
        return self.project(
            name: name,
            product: .app,
            bundleID: bundleID,
            platform: platform,
            iOSTargetVersion: iOSTargetVersion,
            dependencies: dependencies,
            infoPlist: infoPlist
        )*/
    }
    
    public static func framework(
        name: String,
        platform: Platform,
        bundleID: String,
        iOSTargetVersion: String,
        dependencies: [TargetDependency] = []
    ) -> Project {
        let targets = self.makeFrameworkTargets(name: name, platform: platform, iOSTargetVersion: iOSTargetVersion, bundleID: bundleID, dependencies: dependencies)
        return Project(name: name, targets: targets)
        /*
        return self.project(
            name: name,
            product: .framework,
            bundleID: bundleID,
            platform: platform,
            iOSTargetVersion: iOSTargetVersion,
            dependencies: dependencies
        )*/
    }
    
    public static func frameworkWithApp(
        name: String,
        platform: Platform,
        bundleID: String,
        iOSTargetVersion: String,
        dependencies: [TargetDependency] = [],
        infoPlist: [String: InfoPlist.Value] = [:]
    ) -> Project {
        var targets = self.makeFrameworkTargets(name: name, platform: platform, iOSTargetVersion: iOSTargetVersion, bundleID: bundleID, dependencies: dependencies)
        
        var _dependencies = Array(dependencies)
        _dependencies.append(.target(name: name))
        targets.append(contentsOf: self.makeAppTargets(name: "\(name)-demo", platform: platform, bundleID: "\(bundleID)-demo", iOSTargetVersion: iOSTargetVersion, infoPlist: infoPlist, dependencies: _dependencies))
        
        return Project(name: name, targets: targets)
    }
    /*
     struct Target(
     name: String,
     platform: Platform,
     product: Product,
     productName: String?,
     bundleId: String,
     deploymentTarget: DeploymentTarget?,
     infoPlist: InfoPlist,
     sources: SourceFilesList?,
     resources: ResourceFileElements?,
     copyFiles: [CopyFilesAction]?,
     headers: Headers?,
     entitlements: Path?,
     scripts: [TargetScript],
     dependencies: [TargetDependency],
     settings: Settings?,
     coreDataModels: [CoreDataModel],
     environment: [String : String],
     launchArguments: [LaunchArgument],
     additionalFiles: [FileElement])
     */
    /*
     enum Product {
     case app
     case appClip
     case appExtension
     case bundle
     case commandLineTool
     case dynamicLibrary
     case framework
     case messagesExtension
     case staticFramework
     case staticLibrary
     case stickerPackExtension
     case tvTopShelfExtension
     case uiTests
     case unitTests
     case watch2App
     case watch2Extension
     
     }
     */
    public static func project(
        name: String,
        product: Product,
        bundleID: String,
        platform: Platform,
        iOSTargetVersion: String,
        dependencies: [TargetDependency] = [],
        infoPlist: [String: InfoPlist.Value] = [:],
        targets: [Target]
    ) -> Project {
        return Project(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: bundleID,
                    deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
                    infoPlist: .extendingDefault(with: infoPlist),
                    sources: ["Sources/**"],
                    resources: [],
                    dependencies: dependencies
                ),
                Target(
                    name: "\(name)Tests",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(bundleID).\(name)Tests",
                    infoPlist: .default,
                    sources: "Tests/**",
                    dependencies: [
                        .target(name: "\(name)")
                    ]
                )
            ]
        )
    }
    
    //    // MARK: - Private
    //
    //    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, platform: Platform, iOSTargetVersion: String, bundleID: String, dependencies: [TargetDependency]) -> [Target] {
        let sources = Target(name: name,
                             platform: platform,
                             product: .framework,
                             bundleId: bundleID,
                             deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
                             infoPlist: .default,
                             sources: ["Sources/**"],
                             resources: [],
                             dependencies: dependencies)
        let tests = Target(name: "\(name)Tests",
                           platform: platform,
                           product: .unitTests,
                           bundleId: "\(bundleID).\(name)Tests",
                           infoPlist: .default,
                           sources: ["Tests/**"],
                           resources: [],
                           dependencies: [.target(name: name)])
        return [sources, tests]
    }
    //
    //    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, bundleID: String, iOSTargetVersion: String, infoPlist: [String: InfoPlist.Value], dependencies: [TargetDependency]) -> [Target] {
//        let platform: Platform = platform
        //        let infoPlist: [String: InfoPlist.Value] = [
        //            "CFBundleShortVersionString": "1.0",
        //            "CFBundleVersion": "1",
        //            "UIMainStoryboardFile": "",
        //            "UILaunchStoryboardName": "LaunchScreen"
        //            ]
        
        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: bundleID,
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: [],
            dependencies: dependencies
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(bundleID).\(name)Tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "\(name)")
            ])
        return [mainTarget, testTarget]
    }
}
