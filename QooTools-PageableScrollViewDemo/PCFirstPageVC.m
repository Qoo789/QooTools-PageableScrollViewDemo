//
//  PCFirstPageVC.m
//  QooTools-PageableScrollViewDemo
//
//  Created by pincai on 2017/11/14.
//  Copyright © 2017年 Pincai. All rights reserved.
//

#import "PCFirstPageVC.h"
#import "UIScrollView+PCPageableScrollView.h"
#import "PCDetailVC.h"

@interface PCFirstPageVC ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *firstPageTable;

@end

@implementation PCFirstPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.firstPageTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.firstPageTable.dataSource = self;
    self.firstPageTable.delegate = self;
    
    // 这里需要对 tableView 设置一次 contentSize, 需要知道 tableView 可以滚动的总高度
    self.firstPageTable.contentSize = CGSizeMake(0, 80 * 15);
    
    [self.view addSubview:self.firstPageTable];
    
    PCDetailVC *detailVC = [[PCDetailVC alloc] init];
    [self addChildViewController:detailVC];
    
    if (detailVC.view != nil) {
        self.firstPageTable.secondScrollView = detailVC.secondTableView;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第一页 - 第%ld行", indexPath.row + 1];
    return cell;
}

@end
