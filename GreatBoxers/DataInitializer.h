//
//  DataInitializer.h
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DataInitializer : NSObject{
    sqlite3 *myDB;
    sqlite3_stmt * statement;
}

-(void) setUpDB;
-(void)getAllData;
-(void)fetchData;

@property(nonatomic, retain)NSMutableArray * WDivision;
@property (nonatomic, retain)NSString * dbPath;


@end
