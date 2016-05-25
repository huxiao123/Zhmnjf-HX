//
//  RushToPurchaseCell.m
//  Zhmnjf-HX
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "RushToPurchaseCell.h"
#import "ZeroBuyViewCtronller.h"
#import "ZeroBuyDetailViewCtroller.h"
#import "PublishViewController.h"
#import "FriendController.h"

@implementation RushToPurchaseCell

- (void)awakeFromNib {
    self.imageArray = @[@"护肤@2x",@"魅蓝@2x",@"护肤@2x",@"护肤@2x",@"魅蓝@2x"];
    CGFloat cardWidth = [UIScreen mainScreen].bounds.size.width*5.0f/7.0f;
    self.cardSize = CGSizeMake(cardWidth, 100);
    
    self.carousel = [[iCarousel alloc] initWithFrame:CGRectMake(50, 0, self.frame.size.width, 100)];
    self.ICarousel = self.carousel;

    self.carousel.currentItemIndex = 1;
    self.carousel.delegate = self;
    self.carousel.dataSource = self;
    self.carousel.type = iCarouselTypeCoverFlow;
    self.carousel.bounceDistance = 0.2f;

}

- (iCarousel *)configiCarousel {
    
    [self addTapGesture];

    return nil;
}

- (void)addTapGesture{
    self.iphoneBgView.userInteractionEnabled = YES;
    self.leftImageView.userInteractionEnabled = YES;
    self.rightImageView.userInteractionEnabled = YES;
    self.shaiDanShare.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(TapGesture)];
    UIView *sigleView = [tapGesture view];
    sigleView.tag = 1;
    
    UITapGestureRecognizer *leftTapGesture = [[UITapGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(TapGesture)];
    UIView *sigleView2 = [leftTapGesture view];
    sigleView2.tag = 2;
    
    UITapGestureRecognizer *rightTapGesture = [[UITapGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(TapGesture)];
    UIView *sigleView3 = [rightTapGesture view];
    sigleView3.tag = 3;
    
    UITapGestureRecognizer *shareTapGesture = [[UITapGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(shareTapGesture)];
    
    [self.iphoneBgView addGestureRecognizer:tapGesture];
    [self.leftImageView addGestureRecognizer:leftTapGesture];
    [self.rightImageView addGestureRecognizer:rightTapGesture];
    [self.shaiDanShare addGestureRecognizer:shareTapGesture];
}

- (void)shareTapGesture{
    NSLog(@"朋友圈");
    FriendController *control = [[FriendController alloc]init];
    control.title = @"商品列表";
     [self.viewController.navigationController pushViewController:control animated:YES];
}

- (void)TapGesture{
    ZeroBuyDetailViewCtroller *control = [[ZeroBuyDetailViewCtroller alloc]init];
    [self.viewController.navigationController pushViewController:control animated:YES];
    NSLog(@"-------");
}

- (IBAction)AllPulishBtnAction:(id)sender {
    PublishViewController *control = [[PublishViewController alloc]init];
    [self.viewController.navigationController pushViewController:control animated:YES];
}

- (IBAction)AllZeroBuyBtnAction:(id)sender {
    ZeroBuyViewCtronller *control = [[ZeroBuyViewCtronller alloc]init];
    [self.viewController.navigationController pushViewController:control animated:YES];
    
}

- (UIViewController *)viewController
{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = [next nextResponder];
        
    } while (next != nil);
    
    
    return nil;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 5;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return self.cardSize.width;
}



- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIView *cardView = view;
    
    if ( !cardView )
    {
        cardView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.cardSize.width, self.cardSize.height)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:cardView.bounds];
        imageView.image = [UIImage imageNamed:self.imageArray[index]];
        [cardView addSubview:imageView];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        //        imageView.backgroundColor = [UIColor whiteColor];
        
        cardView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:imageView.frame cornerRadius:5.0f].CGPath;
        cardView.layer.shadowRadius = 3.0f;
        cardView.layer.shadowColor = [UIColor blackColor].CGColor;
        cardView.layer.shadowOpacity = 0.5f;
        cardView.layer.shadowOffset = CGSizeMake(0, 0);
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = imageView.bounds;
        layer.path = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:5.0f].CGPath;
        imageView.layer.mask = layer;
    }
    
    return cardView;
}

//- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
//{
//     return 15;;
//}
//
- (BOOL)shouldAutorotateToInterfaceOrientation:(__unused UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
//
- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return 0;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * self.carousel.itemWidth);
}


- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSNumber *item = (self.items)[(NSUInteger)index];
    NSLog(@"Tapped view number: %@", item);
}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{
    NSLog(@"Index: %@", @(self.carousel.currentItemIndex));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
