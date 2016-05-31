## Imba iOS 开发规范
* Xcode 模板文件在当前路径的`/Xcode Templates/ObjC/`下面
* 替换系统XCode模板的方法，`Application`下面右键`Xcode`显示包内容，路径为: `/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source/Cocoa Touch Class.xctemplate
`

**宏的使用**

```objectivec
/*
 * 1. 能使用静态常量的尽量使用静态常量，少使用全局的宏
 */
```

**控制器**

**代理方法**


```objectivec
// 所有的viewController内部实现一个或多个从外部push进来的方法, 比如：


@protocol TestViewControllerDelegate <NSObject>

// 只要可以用代理实现的都用代理，不要使用block，block不好跳转到声明页面
// 所有的代理方法加上 #prefix#_#当前类#
// 这里的prefix如果是项目控制器，或者一些非私有组件，尽量都使用imba最为前缀
- (void)imba_testViewController:(UIViewController *)testVC didSelectIndex:(NSInteger)index;

@end

@interface TestViewController

// 方法里面需要的参数尽量使用基本数据类型（少用自定义的Model类型）
// push方法
+ (TestViewController *)pushFromViewController:(UIViewController)viewController param1:(NSString *)param1 param2:(NSString *)param1;
// present方法
+ (TestViewController *)presentFromViewController:(UIViewController *)viewController param1:(NSString *)param1 param2:(NSString *)param2 completion:(void(^)(void))completion;

//代理使用weak声明
@property (nonatomic, weak) id<TestViewControllerDelegate>delegate;

@end

@implementation

+ (TestViewController *)pushFromViewController:(UIViewController)viewController param1:(NSString *)param1 param2:(NSString *)param1 
{
	TestViewController *testVC = [[TestViewController alloc] initWithNibName:NSStringFromClass([TestViewController class]) bundle:nil];
	
	testVC.param1 = param1;
	testVC.param2 = param2;
	// 此处可以用NSAssert来做错误判断
	
	if(viewController.navigationController) {
	// 如果有需要animated也可以作为参数传递，默认可以为YES
		[viewController.navigationController pushViewController:testVC animated:YES];
	}
	return testVC;
}

+ (TestViewController *)presentFromViewController:(UIViewController *)viewController param1:(NSString *)param1 param2:(NSString *)param2 completion:(void(^)(void))completion
{
	TestViewController *testVC = [[TestViewController alloc] initWithNibName:NSStringFromClass([TestViewController class]) bundle:nil];
	testVC.param1 = param1;
	testVC.param2 = param2;
	[viewController presentViewController:testVC animated:YES completion:completion];
	return testVC;
}

@end

```

**枚举**

> 枚举类型定义到一个公共的枚举头文件中，避免多个枚举命名相同导致项目冲突，枚举类型以大写`Imba`开头

**头文件的标准注释**

```objectivec

@interface viewController: UIViewController

//!@brief 什么什么的id
@property (nonatomic, copy) NSString *vid;

/**
 *  什么什么的id
 */
@property (nonatomic, copy) NSString *pid;

// 上面两种写法都可以

/**
 *  方法描述
 *
 *  @param vid    vid参数是什么
 *  @param param1 参数2是什么
 *  @param param2 参数3是什么
 *
 *  @return 返回值是什么
 */
- (NSString *)testWithVID:(NSString *)vid param1:(NSString *)param1 param2:(NSString *)param2;
@end

```


**判断语句** 尽量使用 `if` 加上 `return` 的操作来完成，复杂嵌套尽量保证这样的句式
比如: 

```objectivec
- (void)someMethod 
{  
	if (![someOther boolValue]) {  
		return;  
	}
	
	// 正常执行代码
}  
  
```


