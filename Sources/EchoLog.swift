//
//  EchoLog.swift
//  Echooo
//
//  Created by liukun on 2023/3/30.
//

import Foundation
#if DEBUG
import SwiftyBeaver
#endif

public enum EchoLogDestination {
    case console
    case file
}

open class EchoLog {
#if DEBUG
    private static var beaver = SwiftyBeaver.self
#endif

    open class func addLogDestination(_ destination: EchoLogDestination) {
#if DEBUG
        switch destination {
        case .console:
            let console = ConsoleDestination()
            console.format = "$Dyyyy-MM-dd HH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
            beaver.addDestination(console)
        case .file:
            let file = FileDestination()
            file.format = "$Dyyyy-MM-dd HH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
            beaver.addDestination(file)
        }
#endif
    }
}

extension EchoLog {
    // MARK: Levels
    open class func verbose(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
#if DEBUG
        beaver.verbose(message(), file, function, line: line, context: context)
#endif
    }

    open class func debug(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
#if DEBUG
        beaver.debug(message(), file, function, line: line, context: context)
#endif
    }

    open class func info(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
#if DEBUG
        beaver.info(message(), file, function, line: line, context: context)
#endif
    }

    open class func warning(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
#if DEBUG
        beaver.warning(message(), file, function, line: line, context: context)
#endif
    }

    /// log something which will keep you awake at night (highest priority)
    open class func error(_ message: @autoclosure () -> Any, _
        file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
#if DEBUG
        beaver.error(message(), file, function, line: line, context: context)
#endif
    }
}
