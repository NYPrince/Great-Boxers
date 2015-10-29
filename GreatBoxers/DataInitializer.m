//
//  DataInitializer.m
//  GreatBoxers
//
//  Created by Rick Williams on 7/22/14.
//  Copyright (c) 2014 Rick Williams. All rights reserved.
//

#import "DataInitializer.h"
#import <sqlite3.h>
#import "Boxer.h"
#import "WeightDivision.h"




@implementation DataInitializer

-(void)weightDivision{
    
    WeightDivision * heavyWeight = [[WeightDivision alloc]init];
    heavyWeight.divisionName = @"HeavyWeight";
    heavyWeight.boxerList = [[NSMutableArray alloc]init];
    
    
    WeightDivision * middleWeight = [[WeightDivision alloc]init];
    middleWeight.divisionName = @"MiddleWeight";
    middleWeight.boxerList = [[NSMutableArray alloc]init];
    
    
    WeightDivision * welterWeight = [[WeightDivision alloc]init];
    welterWeight.divisionName =@"WelterWeight";
    welterWeight.boxerList = [[NSMutableArray alloc]init];
    
    WeightDivision * lightWeight = [[WeightDivision alloc]init];
    lightWeight.divisionName = @"LightWeight";
    lightWeight.boxerList = [[NSMutableArray alloc]init];
    
    WeightDivision * featherWeight = [[WeightDivision alloc]init];
    featherWeight.divisionName = @"FeatherWeight";
    featherWeight.boxerList = [[NSMutableArray alloc]init];
    
    self.WDivision = [[NSMutableArray alloc]initWithObjects:heavyWeight,middleWeight, welterWeight, lightWeight, featherWeight, nil];
    
    
}

-(void)setUpDB{
    
    NSString * docsDir;
    NSArray * dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSLog (@"Documents directory = %@", docsDir);
    
    NSString * dataPath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"Boxers.sqlite"]];
    self.dbPath = dataPath;
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath: dataPath] == NO){
        
        NSLog(@"File is not found");
        
        NSString * filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Boxers.sqlite"];
        NSLog(@"%@", filePath);
        
        NSError * err;
        
        BOOL ok = [fileManager copyItemAtPath:filePath toPath:dataPath error:&err];
        
        if(!ok) {
            
            NSLog(@"%@", [err localizedDescription]);
            
        }
        
        else {
            NSLog(@"database file found");
        }
        
    }
    
}

-(void)fetchData {
    
    
    const char * dbpath_C = [self.dbPath UTF8String];
    int status = sqlite3_open(dbpath_C, &myDB);
    
    if(status != SQLITE_OK)return;
    
    
    for(int i = 0; i< self.WDivision.count; i++){
        
        WeightDivision * div = self.WDivision[i];
        NSString * divName = div.divisionName;
        
        NSString * theSelectment = [NSString stringWithFormat:
                                    @"select * from Fighters where WeightDivision = '%@'", divName];
        
        const char * theSelectment_C = [theSelectment UTF8String];
        
        NSLog(@"SQL stmt = %@", theSelectment);
        
        int stmtStatus = sqlite3_prepare_v2(myDB, theSelectment_C, -1, &statement, NULL);
        
        if(stmtStatus == SQLITE_OK){
            
            while (sqlite3_step(statement) == SQLITE_ROW){
                
                
                const char * boxerImage_C = (const char *) sqlite3_column_text(statement, 1);
                const char * weightDivison_C = (const char *) sqlite3_column_text(statement, 2);
                const char * BoxerName_C = (const char *) sqlite3_column_text(statement, 3);
                const char * url_C = (const char *) sqlite3_column_text(statement, 4);
                const char * FightUrl_C = (const char *) sqlite3_column_text(statement, 0);
                
                
                NSString * boxerImage = [[NSString alloc]initWithUTF8String:boxerImage_C];
                NSString * weightDivison = [[NSString alloc]initWithUTF8String:weightDivison_C];
                
                NSString * url = [[NSString alloc]initWithUTF8String:url_C];
                NSString * FightUrl = [[NSString alloc]initWithUTF8String:FightUrl_C];
                
                
                NSString * boxerName = [NSString stringWithUTF8String:BoxerName_C];
                
                NSLog(@"Here's the print out of the fighters %@ %@ %@ %@ %@ ", boxerImage, weightDivison, url, boxerName, FightUrl);
                
                
                Boxer * fighter = [[Boxer alloc]init];
                
                fighter.boxerImage = boxerImage;
                fighter.boxerWeight = weightDivison;
                fighter.boxerName = boxerName;
                fighter.boxerURL = url;
                fighter.fighterUrl = FightUrl;
                
                [div.boxerList addObject:fighter];
                NSLog(@"FIGHTER: %@",fighter);
            }
            sqlite3_finalize(statement);
        }
    }
    sqlite3_close(myDB);
    
}

-(void)getAllData{
    
    [self setUpDB];
    [self weightDivision];
    [self fetchData];
}



@end
