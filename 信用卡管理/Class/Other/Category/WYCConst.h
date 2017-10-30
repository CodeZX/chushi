
#import <UIKit/UIKit.h>
typedef enum {
    WYCTopicTypeWhose = 0,
    WYCTopicTypeNews = 1,
    WYCTopicTypeStrategy = 2
}WYCTopicType;
/** 精华－顶部标题的高度 */
UIKIT_EXTERN CGFloat const WYCTitilesViewH;
/** 精华－顶部标题的y */
UIKIT_EXTERN CGFloat const WYCTitilesViewY;

/** 精华－cell-间距 */
UIKIT_EXTERN CGFloat const WYCTopicCellMargin;
/** 精华－cell-文字的y值 */
UIKIT_EXTERN CGFloat const WYCTopicCellTextY;
/** 精华－cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const WYCTopicCellBottonBarH;
/** 精华－cell－图片帖子的最大高度 */
UIKIT_EXTERN CGFloat const WYCTopicCellPictureMaxH;
/** 精华－cell－图片帖子一旦超过最大高度就用reak */
UIKIT_EXTERN CGFloat const WYCTopicCellPictureBreakH;
