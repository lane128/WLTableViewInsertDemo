//
//  ViewController.m
//  WLTableViewInsertDemo
//
//  Created by Lane on 16/7/28.
//  Copyright © 2016年 cn.whaley. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [UIView new];
    _dataArray = [[NSMutableArray alloc] initWithCapacity:10];
//    _dataArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5",nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLCell"];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self insertRowToTableView];
}

#pragma mark - Private

- (void)insertRowToTableView{
    [_dataArray addObject:[NSString stringWithFormat:@"%zd", _dataArray.count + 1]];
    NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0];
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    [self.tableView endUpdates];
}

- (IBAction)buttonTapped:(id)sender {
    [self insertRowToTableView];
}

@end
