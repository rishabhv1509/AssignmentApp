//
//  MockStoreData.swift
//  AssignmentAppTests
//
//  Created by Rishabh Verma on 06/03/23.
//

import Foundation
@testable import AssignmentApp

var mockstoreData = StoreResponseModel(status: "success", error: "null", data: ItemsList(items: [
    Item(name: "Item 1", price: "₹ 100",image: "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: "Same day shipping"),
    Item(name: "Item 2", price: "₹ 400",image:"https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: "Same day shipping"),
    Item(name: "Item 3", price: "₹ 100",image: "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: "Same day shipping"),
    Item(name: "Item 4", price: "₹ 80",image: "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: nil),
    Item(name: "Item 5", price: "₹ 190",image: "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: nil),
    Item(name: "Item 6", price: "₹ 70",image: "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: nil),
    Item(name: "Item 7", price: "₹ 190",image: "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: nil),
    Item(name: "Item 8", price: "₹ 190",image: "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: nil),
    Item(name: "Item 9", price: "₹ 190",image: "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",extra: nil),
]
                                                                                    )
)

var rawData =
"""
{
"status": "success",
"error": null,
"data": {
    "items": [{
        "name": "Item 1",
        "price": "₹ 100",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": "Same day shipping"
    }, {
        "name": "Item 2",
        "price": "₹ 400",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": "Same day shipping"
    }, {
        "name": "Item 3",
        "price": "₹ 100",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": "Same day shipping"
    }, {
        "name": "Item 4",
        "price": "₹ 80",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": null
    }, {
        "name": "Item 5",
        "price": "₹ 190",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": null
    }, {
        "name": "Item 6",
        "price": "₹ 70",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": null
    }, {
        "name": "Item 7",
        "price": "₹ 190",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": null
    }, {
        "name": "Item 8",
        "price": "₹ 190",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": null
    }, {
        "name": "Item 9",
        "price": "₹ 190",
        "image": "https://imgstatic.phonepe.com/images/dark/app-icons-ia-1/transfers/80/80/ic_check_balance.png",
        "extra": null
    }]
}
}
"""
