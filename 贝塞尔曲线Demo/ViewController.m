//
//  ViewController.m
//  贝塞尔曲线Demo
//
//  Created by 周浩 on 16/6/23.
//  Copyright © 2016年 周浩. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** <#注释#> */
@property (nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property (nonatomic, strong) NSArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initTableView];
    self.dataArray = @[@"1.画出内侧的圆弧",@"2.画出外侧的刻度",@"3.增加刻度值",@"4.实现速度显示",@"5.实现进度"];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if(nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentify];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:16.f];
        cell.textLabel.textColor = [UIColor colorWithWhite:0.2f alpha:1.f];
        cell.textLabel.highlightedTextColor = cell.textLabel.textColor;
    }
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondViewController *vc = [[SecondViewController alloc] init];
    switch (indexPath.row) {
        case 0:
            vc.bezierStyle = BezierStyleOne;
            break;
        case 1:
            vc.bezierStyle = BezierStyleTwo;
            break;
        case 2:
            vc.bezierStyle = BezierStyleThree;
            break;
        case 3:
            vc.bezierStyle = BezierStyleFour;
            break;
        case 4:
            vc.bezierStyle = BezierStyleFive;
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:true];
}
@end
