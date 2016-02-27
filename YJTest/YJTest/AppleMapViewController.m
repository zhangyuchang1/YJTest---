//
//  AppleMapViewController.m
//  YJTest
//
//  Created by zyc on 16/2/27.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "AppleMapViewController.h"
#import <MapKit/MapKit.h>
#import "WXAnation.h"

@interface AppleMapViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    
    NSMutableArray    *_nearbyInfoArray;    //附近的 IOP 信息
    
    WXAnation  *_searchAnnotation;        //搜索坐标的 annotation
}

@end

@implementation AppleMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //阴影
    _toolBarView.layer.shadowColor = [[UIColor grayColor] CGColor];
    _toolBarView.layer.shadowOffset = CGSizeMake(3, 3);
    _toolBarView.layer.shadowOpacity = 1;
    
    _nearbyInfoArray = [NSMutableArray array];
    
    
    //定位
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    if([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
        [_locationManager requestAlwaysAuthorization];
    }
    
    _locationManager.delegate = self;
    
    [_locationManager startUpdatingLocation];
    
    //    北纬30.246092, 东经120.143051 西湖
    
    [self.mapView setDelegate:self];
    
    _mapView.showsUserLocation = YES;
    
    [self.mapView setMapType:MKMapTypeStandard];

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
- (IBAction)search:(UIButton *)sender {
    
    
    [self hiddenKeybord];
    
    if (_long_textField.text.length <2 || _lat_textFeild.text.length<2) {
        return;
    }
    
    // long 0-180  lat 0-90 是否超出范围
    
    double lng = [_long_textField.text doubleValue];
    double lat = [_lat_textFeild.text doubleValue];
    
    if ( fabs(lng) > 180 || fabs(lat) > 90) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"输入不正确" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alertView show];
        return;
    }
    
    
    
    
    //移去大头针
    [_nearbyInfoArray removeAllObjects];
    NSArray *annotations = [NSArray arrayWithArray:self.mapView.annotations];
    
    for (WXAnation *annotation in annotations) {
        if ([annotation isMemberOfClass:[WXAnation class]]) {
            [_mapView removeAnnotation:annotation];
        }
    }
    //输入的地点
    [self fetchAddressFormLong:lng lat:lat];
    
    
    
}

- (void)fetchAddressFormLong:(double)lng lat:(double)lat{
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (!error) {
            
            for (CLPlacemark *place in placemarks) {
                
                
                //创建Anination对象
                CLLocationCoordinate2D showCoordinate = {lat,lng};
                
                WXAnation *annation1 = [[WXAnation alloc] initWithCLLocationCoordinate2D:showCoordinate];
                
                annation1.title = place.name;
                MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:(MKPlacemark *)place];
                
                annation1.subtitle = [self completeAddressFromMKMapItem:mapItem];
                
                _searchAnnotation = annation1;  //区分
                [self.mapView addAnnotation:annation1];
                
                for (int i = 0; i< 10; i++) {
                    
                    //                    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat+0.001*i, lng+0.001*i);
                    //                    WXAnation *anno = [[WXAnation alloc] initWithCLLocationCoordinate2D:coordinate];
                    //
                    //                    [self.mapView addAnnotation:anno];
                    
                }
                
                for (int i = 0; i< 10; i++) {
                    
                    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat+0.001*i, lng);
                    WXAnation *anno = [[WXAnation alloc] initWithCLLocationCoordinate2D:coordinate];
                    
                    [self.mapView addAnnotation:anno];
                    
                }
                for (int i = 0; i< 10; i++) {
                    
                    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat, lng+0.001*i);
                    WXAnation *anno = [[WXAnation alloc] initWithCLLocationCoordinate2D:coordinate];
                    
                    [self.mapView addAnnotation:anno];
                    
                }
                
                
                
                
                
                CLLocationCoordinate2D center = {lat,lng};
                //显示精度
                MKCoordinateSpan span = {0.05,0.05};
                
                MKCoordinateRegion region = {center,span};
                
                [self.mapView setRegion:(region) animated:YES];
            }
            
        }else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"地址解析失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
        
        
    }];
}


#pragma mark ----CLLocationManagerDelegate --
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D coordinate = newLocation.coordinate;
    
    NSLog(@"经度:%f,纬度:%f",coordinate.longitude,coordinate.latitude);
    
    
    //停止实时定位
    [manager stopUpdatingLocation];
    
    //坐标 地图初始化时显示的坐标
    CLLocationCoordinate2D center = newLocation.coordinate;
    //显示精度
    MKCoordinateSpan span = {0.05,0.05};
    
    MKCoordinateRegion region = {center,span};
    
    //地图初始化时显示的区域
    [self.mapView setRegion:(region)];
    
    
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *place in placemarks) {
            
            NSLog(@"name %@",place.name);                       //位置名
            NSLog(@"thoroughfare %@",place.thoroughfare);       //街道
            NSLog(@"subThoroughfare %@",place.subThoroughfare); //子街道
            NSLog(@"locality %@",place.locality);               //市
            NSLog(@"subLocality %@",place.subLocality);         //区
            NSLog(@"country %@",place.country);                 //国家
            
            
            
        }
    }];
    
    
}

//获取周边 10个地点信息

- (void)fetchNearbyInfoWithCLLocationCoordinate2D:(CLLocationCoordinate2D)location{
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 100,100 );
    
    MKLocalSearchRequest *requst = [[MKLocalSearchRequest alloc] init];
    requst.region = region;
    requst.naturalLanguageQuery = @"餐厅"; //想要的信息 类型
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:requst];
    
    //    100，为直径  但是苹果会根据搜索结果进行调整，所以显示出来的不一定在这个范围内
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        if (!error)
        {
            
            NSLog(@"%@",response);
            for (int i = 0; i < (response.mapItems.count > 30 ? 30 :response.mapItems.count); i ++) {
                
                [_nearbyInfoArray addObject:response.mapItems[i]];
            }
            
            
            for (MKMapItem *mapItem in _nearbyInfoArray) {
                
                
                
                MKPlacemark *placeMark = mapItem.placemark;
                CLLocationCoordinate2D coordinate   = placeMark.coordinate;
                
                WXAnation *anation = [[WXAnation alloc] initWithCLLocationCoordinate2D:coordinate];
                anation.title =  mapItem.name;
                anation.subtitle = [self completeAddressFromMKMapItem:mapItem];
                
                
                [self.mapView addAnnotation:anation];
                
            }
            
        }
        
    }];
    
}

#pragma mark-- MKAnnotationView delegate ---

//--------------------------大头针标示图-----------------------------
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    //判断是否为当前位置的annotation
    if ([annotation isMemberOfClass:[MKUserLocation class]]) {
        //返回nil就使用默认的标注视图
        return nil;
    }
    
    
    static NSString *identifier = @"Annotation";
    
    //MKPinAnnotationView 大头针视图
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (annotationView == nil) {
        
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        //是否显示标题
        annotationView.canShowCallout = YES;
        
        
    }
    
    
    
    annotationView.pinColor = MKPinAnnotationColorGreen;
    
    //区分
    if (_searchAnnotation == annotation) {
        annotationView.pinColor = MKPinAnnotationColorPurple;
        //右边视图
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(0, 0, 80, 60)];
        
        [button setBackgroundColor:[UIColor lightGrayColor]];
        [button setTitle:@"查看周边" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        [button addTarget:self action:@selector(cilckAction) forControlEvents:UIControlEventTouchUpInside];
        annotationView.rightCalloutAccessoryView = button;
        
    }
    
    annotationView.annotation = annotation;
    
    annotationView.animatesDrop = YES;
    return annotationView;
}

//查看周边
- (void)cilckAction
{
    //移去大头针
    [_nearbyInfoArray removeAllObjects];
    NSArray *annotations = [NSArray arrayWithArray:self.mapView.annotations];
    
    for (WXAnation *annotation in annotations) {
        if ([annotation isMemberOfClass:[WXAnation class]] && (annotation != _searchAnnotation)) {
            [_mapView removeAnnotation:annotation];
        }
    }
    
    CLLocationCoordinate2D location = _searchAnnotation.coordinate;
    [self fetchNearbyInfoWithCLLocationCoordinate2D:location];
    
}
//反编码 后 位置拼接
- (NSMutableString *)completeAddressFromMKMapItem:(MKMapItem *)mapItem
{
    NSMutableString *muatbleStr = [[NSMutableString alloc] init];
    
    [muatbleStr appendString:mapItem.placemark.country];
    [muatbleStr appendString:(mapItem.placemark.administrativeArea ? mapItem.placemark.administrativeArea :@"")];
    
    [muatbleStr appendString:(mapItem.placemark.locality ? mapItem.placemark.locality : @"")];
    [muatbleStr appendString:(mapItem.placemark.subLocality ? mapItem.placemark.subLocality : @"")];
    [muatbleStr appendString:(mapItem.placemark.thoroughfare ? mapItem.placemark.thoroughfare : @"")];
    [muatbleStr appendString:(mapItem.placemark.subThoroughfare ? mapItem.placemark.subThoroughfare : @"")];
    
    return muatbleStr;
}
- (void)hiddenKeybord
{
    
    [self.view endEditing:YES];
}
@end

