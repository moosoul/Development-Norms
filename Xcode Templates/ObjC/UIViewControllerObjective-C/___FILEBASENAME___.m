//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - View Lifecycle （View 的生命周期）
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pargma mark - System Delegate (系统代理)


#pargma mark - Custom Delegate (自定义代理)


#pragma mark - IBActions (通过Xib连接的按钮点击)


#pargma mark - event response (事件响应, notification写在这里)


#pragma mark - Public Method (公有方法，会在头文件暴露在外部)


#pragma mark - Private Method (私有方法)


#pragma mark - SuperClass (方法重载)


#pargma mark - getters and setters (自定义访问器)



@end
