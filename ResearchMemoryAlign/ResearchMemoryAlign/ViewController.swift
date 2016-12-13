//
//  ViewController.swift
//  ResearchMemoryAlign
//
//  Created by mothule on 2016/12/07.
//  Copyright © 2016年 mothule. All rights reserved.
//

import UIKit
import Foundation
import Darwin

struct AnyStructureA {
    var integer0:UInt8
}
struct AnyStructureB {
    var integer0:UInt8
    var integer1:UInt16
}
struct AnyStructureC {
    var integer0:UInt8
    var integer1:UInt16
    var integer2:UInt32
}
struct AnyStructureD {
    var integer0:UInt8
    var integer1:UInt16
    var integer2:UInt32
    var integer3:UInt64
}
struct AnyStructureE {
    var integer0:UInt8
    var integer1:UInt16
    var integer2:UInt32
    var integer3:UInt64
    var structure0:AnyStructureD
}
struct AnyStructureF {
    var integer0:UInt8
    var integer1:UInt16
    var integer2:UInt32
    var integer3:UInt64
    var structure0:AnyStructureA
}
struct AnyStructureG {
    var integer0:UInt32
    var structure0:AnyStructureA
}
struct AnyStructureH {
    var integer0:UInt32
    var structure0:AnyStructureD
}
struct AnyStructureI {
    var string0:String
}



struct AlignedStructureTypeA {
    var integer0:UInt32
    var integer1:UInt32
}
struct AlignedStructureTypeB {
    var integer0:UInt64
}
struct AlignedStructureTypeC {
    var integer0:UInt16
}

struct NonAlignedStructureTypeA {
    var integer0:UInt8
}
struct NonAlignedStructureTypeA2 {
    var integer0:UInt8
    var integer1:UInt8
}
struct NonAlignedStructureTypeA3 {
    var integer0:UInt8
    var integer1:UInt8
    var integer2:UInt8
}

struct NonAlignedStructureTypeB {
    var integer0:UInt8
    var integer1:UInt32
}

struct NonAlignedStructureTypeC {
    var integer0:UInt32
    var integer1:UInt8
}

struct NonAlignedStructureTypeD {
    var integer0:UInt32
    var integer1:UInt32
    var integer2:UInt8
}
struct NonAlignedStructureTypeE {
    var integer0: UInt64
    var integer1: UInt8
}
struct NonAlignedStructureTypeF {
    var integer1: UInt32
    var integer0: UInt64
}

struct Alignment4Structure{
    var integer0: UInt32
    var integer1: UInt32
}
struct Alignment8Structure{
    var integer0: UInt64
}

struct UserProfile {
    var age:UInt8
    var userId:UInt64
    var height:UInt16
    var birthDate:UInt32
    var weight:UInt16
}
struct UserProfileAligned {
    var userId:UInt64
    var birthDate:UInt32
    var height:UInt16
    var weight:UInt16
    var age:UInt8
}
struct UserProfileOptAligned {
    var userId:UInt32
    var birthDate:UInt32
    var height:UInt8
    var weight:UInt8
    var age:UInt8
}



class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        struct A{
            var val0:UInt8
            var val1:UInt32
        }
        struct B{
            var val0:UInt64
            var val1:UInt8
        }
        class C{
            var val0:UInt64
            init(){val0=UINT64_MAX-1}
        }
        var a = A(val0:170, val1:UINT32_MAX)
//        var b = B(val0:UINT64_MAX, val1:170)
//        var a = UInt64(UINT64_MAX)
        var b = UInt8(170)
        var c = UInt16(UINT16_MAX)
        var d = UInt32(UINT32_MAX)
        
        MemoryLayoutInfo<UInt64>().print()
        MemoryLayoutInfo<UInt8>().print()
        
        
//        reportEachMemoryLayout()
        
//        MemoryLayoutInfo<UserProfile>().print()
//        MemoryLayoutInfo<UserProfileAligned>().print()
//        MemoryLayoutInfo<UserProfileOptAligned>().print()
//        
//        Benchmark.measure(of: {measureOfUserProfileByCrud()}, blockName: "Un Aligned User Profile Structure.")
//        Benchmark.measure(of: {measureOfUserProfileAlignedByCrud()}, blockName: "Aligned User Profile Structure.")
//        Benchmark.measure(of: {measureOfUserProfileOptimizeAndAlignedByCrud()}, blockName: "Aligned and Optimized User Profile Structure.")

//        measure(of: {profile1ByteVariable()}, blockName: "1Byte")
//        measure(of: {profile4ByteVariable()}, blockName: "4Byte")
//        measure(of: {profile8ByteVariable()}, blockName: "8Byte")
    }

    
    private func measureOfUserProfileByCrud() {
        
        let userNum:Int = 50000
        
        var users:[UserProfile] = []
        // Create
        // 5万件のユーザデータを作成する.
        for i in 0..<userNum {
            users.append(UserProfile(age: UInt8(arc4random() % 120),
                                     userId: UInt64(arc4random()),
                                     height: UInt16(50 + i % 200),
                                     birthDate: 20161225,
                                     weight: UInt16(2 + i % 200)))
        }
        
        // Read
        // 5万件のユーザデータから検索する.
        let seniorUsers = users.filter({$0.age >= 60})
        print("60歳以上シニアユーザは\(seniorUsers.count)人.")
        
        // Update
        // 10万件のユーザデータを更新する.
        // structだとCreateと変わらないので特になし
        
        
        // Delete
        // 5万件のユーザデータを削除する.
        for _ in 0..<userNum {
            users.removeFirst()
        }
    }
    private func measureOfUserProfileAlignedByCrud() {
        
        let userNum:Int = 50000
        
        var users:[UserProfileAligned] = []
        // Create
        // 5万件のユーザデータを作成する.
        for i in 0..<userNum {
            users.append(UserProfileAligned(userId: UInt64(arc4random()),
                                            birthDate: 20161225,
                                            height: UInt16(50 + i % 200),
                                            weight: UInt16(2 + i % 200),
                                            age: UInt8(arc4random() % 120)))
        }
        
        // Read
        // 5万件のユーザデータから検索する.
        let seniorUsers = users.filter({$0.age >= 60})
        print("60歳以上シニアユーザは\(seniorUsers.count)人.")
        
        // Update
        // 10万件のユーザデータを更新する.
        // structだとCreateと変わらないので特になし
        
        
        // Delete
        // 5万件のユーザデータを削除する.
        for _ in 0..<userNum {
            users.removeFirst()
        }
    }
    private func measureOfUserProfileOptimizeAndAlignedByCrud() {
        
        let userNum:Int = 50000
        
        var users:[UserProfileOptAligned] = []
        // Create
        // 5万件のユーザデータを作成する.
        for i in 0..<userNum {
            users.append(UserProfileOptAligned(userId: arc4random(),
                                            birthDate: 20161225,
                                            height: UInt8(50 + i % 200),
                                            weight: UInt8(2 + i % 200),
                                            age: UInt8(arc4random() % 120)))
        }
        
        // Read
        // 5万件のユーザデータから検索する.
        let seniorUsers = users.filter({$0.age >= 60})
        print("60歳以上シニアユーザは\(seniorUsers.count)人.")
        
        // Update
        // 10万件のユーザデータを更新する.
        // structだとCreateと変わらないので特になし
        
        
        // Delete
        // 5万件のユーザデータを削除する.
        for _ in 0..<userNum {
            users.removeFirst()
        }
    }

    
    
    private func profile1ByteVariable() {
        typealias Type = UInt8
        var list:[Type] = []
        for i in 1..<1000 {
            list.append(Type(i % 255))
        }
        var list2:[Type] = []
        list.forEach({ _ in
            list2.append( list.min()!)
        })
    }
    private func profile4ByteVariable() {
        typealias Type = UInt32
        var list:[Type] = []
        for i in 1..<1000 {
            list.append(Type(Type(i) % UINT32_MAX))
        }
        var list2:[Type] = []
        list.forEach({ _ in
            list2.append( list.min()!)
        })
    }
    private func profile8ByteVariable() {
        typealias Type = UInt64
        var list:[Type] = []
        for i in 1..<1000 {
            list.append(Type(Type(i) % UINT64_MAX))
        }
        var list2:[Type] = []
        list.forEach({ _ in
            list2.append( list.min()!)
        })
    }
    

    
    
        
    
    
    private func reportEachMemoryLayout()
    {
        MemoryLayoutInfo<AnyStructureA>().print()
        MemoryLayoutInfo<AnyStructureB>().print()
        MemoryLayoutInfo<AnyStructureC>().print()
        MemoryLayoutInfo<AnyStructureD>().print()
        MemoryLayoutInfo<AnyStructureE>().print()
        MemoryLayoutInfo<AnyStructureF>().print()
        MemoryLayoutInfo<AnyStructureG>().print()
        MemoryLayoutInfo<AnyStructureH>().print()
        MemoryLayoutInfo<AnyStructureI>().print()
        print("")
        MemoryLayoutInfo<AlignedStructureTypeA>().print()
        MemoryLayoutInfo<AlignedStructureTypeB>().print()
        MemoryLayoutInfo<AlignedStructureTypeC>().print()
        print("")
        MemoryLayoutInfo<NonAlignedStructureTypeA>().print()
        MemoryLayoutInfo<NonAlignedStructureTypeA2>().print()
        MemoryLayoutInfo<NonAlignedStructureTypeA3>().print()
        MemoryLayoutInfo<NonAlignedStructureTypeB>().print()
        MemoryLayoutInfo<NonAlignedStructureTypeC>().print()
        MemoryLayoutInfo<NonAlignedStructureTypeD>().print()
        MemoryLayoutInfo<NonAlignedStructureTypeE>().print()
        MemoryLayoutInfo<NonAlignedStructureTypeF>().print()
    }
    
}

