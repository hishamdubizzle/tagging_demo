//+---------------------------------------------------------------------------+
//| Copyright (c) 2014 AT Internet.											  |
//| All rights reserved.                                                      |
//| For help with this library contact support@atinternet.com                 |
//| Version Tag 1.5.000                                                       |
//+---------------------------------------------------------------------------+
/*!
 @file ATParams.h
 \brief Use this class for tagging. 
 
 This class gives methods in order to tag what you need and send the associated hit (SalesTracker, clicks, pages, level2, Rich Media, Publisher, self-promotion, etc.). See the tagging documentation for more details on tagging methodology
 */

#import <Foundation/Foundation.h>

/*! Audio type (Rich Media) */
#define kATAudioType		@"audio"
/*! Video type (Rich Media) */
#define kATVideoType		@"video"
/*! Animation type (Rich Media) */
#define kATAnimationType	@"animation"

/*! @enum clicType Used for click tag */
typedef enum {
	/*! Navigation click type */
	navigation= 0,
	/*! Download click type */
	download = 1,
	/*! Exit click type */
	exitPage = 2,
	/*! Action click type */
	action = 3,
} clicType;

/*! @enum mediaType Media Type used for Rich Media tag*/
typedef enum {
	/*! Audio type */
	mediaTypeAudio= 0,
	/*! Video type */
	mediaTypeVideo = 1,
	/*! Animation type */
	mediaTypeAnimation = 2,
} mediaType;

/*! @enum mediaAction Media actions */
typedef enum{
	/*! Play action */
	Play,
	/*! Pause action */
	Pause,
	/*! Stop action */
	Stop,
	/*! Forward action */
	Forward,
	/*! Backward action */
	Backward,
	/*! Share the content action */
	Share,
	/*! Email the content action */
	Email,
	/*! Add to favory action */
	Favor,
	/*! Download the content action */
	DownloadAct,
	/*! Move the readhead */
	Move,
	/*! Information action (mainly for sending buffering state) */
	Info,
	/*! Custom action */
	Perso,
	/*! Refresh action (if activated, it regularly sends hit for more details on the duration viewed) */
	Refresh
}mediaAction;

/*! @enum mediaQuality Media quality*/
typedef enum{
	/*! 22khz quality */
	quality22khz = 1,
	/*! 44khz quality */
	quality44khz = 2,
	/*! 32khz quality */
	quality32khz = 3,
	/*! 70khz quality */
	quality70khz = 4,
}mediaQuality;

/*! @enum mediaStream Media stream speed (should be kbps and not kpbs) */
typedef enum{
	/*! 64 kbps */
	stream64kpbs = 1,
	/*! 128 kbps */
	stream128kpbs = 2,
	/*! 160 kbps */
	stream160kpbs = 3,
	/*! 192 kbps */
	stream192kpbs = 4,
	/*! 224 kbps */
	stream224kpbs = 5,
	/*! 256 kbps */
	stream256kpbs = 6,
	/*! 320 kbps */
	stream320kpbs = 7,
	/*! 22 kbps */
	stream22kpbs = 8,
	/*! 96 kbps */
	stream96kpbs = 9,
	/*! 112 kbps */
	stream112kpbs = 10,
	/*! 300 kbps */
	stream300kpbs = 11,
	/*! 500 kbps */
	stream500kpbs = 12,
	/*! 1000 kbps */
	stream1000kpbs = 13,
}mediaStream;

/*! @enum mediaSource Media source */
typedef enum{
	/*! Internal source */
	sourceInt,
	/*! External source */
	sourceExt
}mediaSource;

/*! @enum mediaSourceType Media source type*/
typedef enum{
	/*! Clip source */
	clip,
	/*! Live source */
	live
}mediaSourceType;

/*! @enum mediaExtension Media extension*/
typedef enum{
	mp3 = 1,
	wma = 2,
	wav = 3,
	aiff = 4,
	aac = 5,
	mpeg = 6,
	flv = 7,
	swf = 8,
	mp4 = 9,
	avi = 10,
	mkv = 11,
	wmv = 12,
	mp3G = 13,
	rm = 14,
	rmvb = 15,
	mov = 16,
	ogg = 17
}mediaExtension;


/*!
 @class ATParams
 \brief Use this class for tagging. 
 
 This class gives methods in order to tag what you need and send the associated hit (SalesTracker, clicks, pages, level2, Rich Media, Publisher, self-promotion, etc.). See the tagging documentation for more details on tagging methodology
 */
@interface ATParams : NSObject {
	/*! @attribute Dictionary which will contain tagging variables and values */
	NSMutableDictionary *params;
	/*! @attribute Used to add product variables with a associated count (e.g. &pdt1=&pdt2=) */
	NSInteger countProducts;
	/*! @attribute Timer for Rich Media refresh hit */
	NSTimer * refreshTimer;
	/*! @attribute Refresh value for Rich Media measure */
	float rfshTime;
}

/*!
 @function
 \brief Initialize params, NSMutableDictionary which will contain all tagging variables and values
 @return self
 */
-(id)init;

/*!
 @function
 \brief Set a visitor identified (&an=&ac= or &at=&ac=)
 @param	isNumericOrTextual Latitude
 @param	visitorId Longitude
 @param	visitorCategory Longitude
 */
-(void)setVisitorIdentified:(BOOL)isNumericOrTextual andId:(NSString *)visitorId andCategory:(NSString *)visitorCategory;

/*!
 @function
 \brief Set a custom tree structure (&ptype=)
 @param	tree custom tree structure (ex : ID1-ID2-ID3)
 */
-(void)setCustomTree:(NSString *)tree;

/*!
 @function
 \brief Set a location (&gy=&gx=)
 @param	latitude Latitude
 @param	longitude Longitude
 */
-(void)setLocation:(double)latitude andLongitude:(double)longitude;

/*!
 @function
 \brief Set a type (&type=) for a hit
 
 This variable is particular, it is used for typing hits (like a media, or for specific ads tagging and other cases). Use this function only when recommended
 @param	type Can be : audio, video, vpre, vmid, vpost, animation, anim, podcast, rss, email, pub, ad, click, at, pdt
 */
-(void)setType:(NSString*)type;

/*!
 @function
 \brief Set a level 2 (&s2=)
 @param level2 Site level 2
 */
-(void)setLevel2:(NSString*)level2;

/*!
 @function
 \brief Set a page ID for static page (&pid=&pchap=&pidt=)
 @param	pageId Page ID
 @param	pageChapter Chapter name of the page
 @param	pageDate Date of change
 */
-(void)setPageId:(NSString*)pageId andPageChapter:(NSString*)pageChapter andPageDate:(NSString*)pageDate;

/*!
 @function
 \brief Set a custom &key=value
 @param	key Custom key
 @param	value Custom value
 */
-(void)put:(NSString*)key andValue:(NSString*)value;

/*!
 @function
 \brief Set a custom critera (&x1=&x2=...) 
 @param	idCritera Critera ID
 @param	valueCritera Value
 */
-(void)setCustomCritera:(NSString*)idCritera andValue:(NSString*)valueCritera;

/*!
 @function
 \brief Set a form critera (&f1=&f2=...)
 @param	idFormCritera Critera ID
 @param	valueForm Value
 */
-(void)setCustomForm:(NSString*)idFormCritera andValue:(NSString*)valueForm;

/*!
 @function
 \brief Set a engine search (&mc=&np=)
 @param	keywords Keyword
 @param	number Number of result pages
 */
-(void)setSearchEngineKeywords:(NSString*)keywords andNumberOfResults:(NSString*)number;

/*!
 @function 
 \brief Set a clic (&clic=)
 This variable is typing the hit as a click (&clic= is enough, &type=click is for very old tags)
 @param	typeIn Click type, enum clicType
 */
-(void)setClic:(clicType)typeIn;

/*!
 @function 
 \brief Set a media type (&type=) (Rich Media)
 @param	type Media type, enum mediaType
 */
-(void)setMediaType:(mediaType)type;

/*!
 @function 
 \brief Set a Media action (&a=) (Rich Media)
 @param	action Action type, enum mediaAction
 */
-(void)setMediaAction:(mediaAction)action;

/*!
 @function
 \brief Set a media quality (&m3=) (Rich Media)
 @param	quality Media quality, enum mediaQuality
 */
-(void)setMediaQuality:(mediaQuality)quality;

/*!
 @function
 \brief Set a media stream (&m4=) (Rich Media)
 @param	stream Media stream, enum mediaStream
 */
-(void)setMediaStream:(mediaStream)stream;

/*!
 @function
 \brief Set a media source (&m5=) (Rich Media)
 @param	source Media source, enum mediaSource
 */
-(void)setMediaSource:(mediaSource)source;

/*!
 @method
 \brief Set a media type (&m6=) (Rich Media)
 @param	type Media source type (int or ext), enum mediaSourceType
 */
-(void)setMediaStreamType:(mediaSourceType)type;

/*!
 @function
 \brief Set a media size (&m7=) (Rich Media)
 @param	size Media size (Ko)
 */
-(void)setMediaSize:(NSString*)size;

/*!
 @function
 \brief Set a media duration (Rich Media)
 @param duration Media duration (sec)
 */
-(void)setMediaDuration:(NSString*)duration;

/*!
 @function
 \brief Set a cart id (&idcart=) (Sales)
 @param	cartId Cart ID
 */
-(void)setCartId:(NSString*)cartId;

/*!
 @function
 \brief Set a order id (&cmd=) (Sales)
 @param	orderId Order ID
 */
-(void)setOrderId:(NSString*)orderId;

/*!
 @function
 \brief Set a sales turnover indicator (&roimt=) (Sales)
 @param	price Sales Turnover indicator
 */
-(void)setOrderPrice:(NSString*)price;

/*!
 @function
 \brief Set a order amount (tax free) (&mtht=) (SalesTraker)
 @param	priceWithoutTaxes Order amount (tax free)
 */
-(void)setOrderPriceWithoutTaxes:(NSString*)priceWithoutTaxes;

/*!
 @function
 \brief Set a order amount (all taxes included) (&mtttc=) (SalesTraker)
 @param	priceWithTaxes Order amount (all taxes included)
 */
-(void)setOrderPriceWithTaxes:(NSString*)priceWithTaxes;

/*!
 @function
 \brief Set a shipping cost (&fp=&fpht=) (SalesTraker)
 @param	shippingWithoutTaxe Shipping cost (all taxes included)
 @param	shippingWithTaxes Shipping cost (tax free)
 */
-(void)setShippingCostWithoutTaxe:(NSString*)shippingWithoutTaxe andWithTaxes:(NSString*)shippingWithTaxes;

/*!
 @function
 \brief Set a tax (&tax=) (SalesTraker)
 @param	taxes Tax value
 */
-(void)setTaxes:(NSString*)taxes;

/*!
 @function
 \brief Set a PaymentMethod (&mp=) (SalesTraker)
 @param	PaymentMethod Payment method ID 
 */
-(void)setPaymentMethod:(NSString*)PaymentMethod;

/*!
 @function
 \brief Set a delivery method (&dl=) (SalesTraker)
 @param	delivery Delivery method
 */
-(void)setDelivery:(NSString*)delivery;

/*!
 @function
 \brief Set a statut for a command (&st=) (SalesTraker)
 @param	status Status ID
 */
-(void)setStatus:(NSString*)status;

/*!
 @function
 \brief Set a New Customer (&newcus=) (SalesTraker)
 @param	NewCustomer New customer ? Yes for new
 */
-(void)setNewCustomer:(BOOL)NewCustomer;

/*!
 @function
 \brief Set a promotion code (&pcd=) (SalesTraker)
 @param	promotionCode Promotion code
 */
-(void)setPromotionCode:(NSString*)promotionCode;

/*!
 @function
 \brief Set a discount amount (&dsc=&dscht=) (SalesTraker)
 @param	dsc Discount amount (all taxes included)
 @param	dscht Discount amount (tax free)
 */
-(void)setDiscountWithTaxes:(NSString*)dsc andWithoutTaxes:(NSString*)dscht;

/*!
 @function
 \brief Set a discount for product (&dscX=&dschtX=&pcodeX= where X is the number of the product) (SalesTraker)
 @param	idProduct Product ID
 @param	dsc Discount (tax included)
 @param	dscht Discount (before tax)
 @param	discountCode Discount code
 */
-(void)setDiscountForProduct:(NSString*)idProduct andDiscountWithTaxes:(NSString*)dsc andDiscountWithoutTaxe:(NSString*)dscht andDiscountCode:(NSString*)discountCode;

/*!
 @function
 \brief Set a custom order variable (&o1=&o2= etc.)
 @param	indicatorId Indicator id (put 1 will result in &o1=)
 @param	indicatorValue Indicator value
 */
-(void)setCustomOrderCritera:(NSString *)indicatorId andValue:(NSString *)indicatorValue;

/*!
 @function
 \brief Tag a click (&s2=&p=&clic=)
 @param	level2 Level 2 tag
 @param	click_name Click label
 @param	typeIn Click type, enum clicType
 */
-(void)xt_click:(NSString*)level2 andClickName:(NSString*)click_name andClickType:(clicType)typeIn;

/*!
 @function
  \brief Send a hit
 
  It calls [[ATTag sharedATTag] tagPage:\@"" withDictionary:self.params];
 */
-(void)xt_sendTag;

/*!
 @function
 \brief   Set a tag (&p=)
 @param		page : page label
 */
-(void)setPage:(NSString*)page;

/*!
 @function
 \brief Tag for advert (&ati= for impression or &atc= for click) (Publisher, self-promotion)
 @param	showOrClick (PUB & Self-promo) YES for impression NO for click
 @param	IntOrExt (PUB & Self-promo) YES for Int NO for Ext
 @param	idCampaign (PUB & Self-promo)
 @param	creation (PUB)
 @param	variant (PUB)
 @param	format (PUB & Self-promo)
 @param adEmplacement ()
 @param	adEmplacementDetail ()
 @param annonceur (PUB)
 @param idProduct (Sel-promo)
 This function has parameters linked to Publisher and Self-promotion, put nil for parameters not used for what you are tagging (-> creation, variant, adEmplacement, adEmplacementDetail and annonceur must be nil if you're tagging Self-promotion. idProduct mus be nil if you are tagging Publisher)
 */
-(void)	 xt_ad:(BOOL)showOrClick
  andIsIntOrExt:(BOOL)IntOrExt 
  andIdCampaign:(NSString*)idCampaign 
  andIdCreation:(NSString*)creation 
	 andVariant:(NSString*)variant
	  andFormat:(NSString*)format
andEmplacement:(NSString*)adEmplacement
andEmplacementDetail:(NSString*)adEmplacementDetail
   andAnnonceur:(NSString*)annonceur
	andIdProduct:(NSString*)idProduct;

/*!
 @function
 \brief Tag for advert in page hit (&ati= for impression) (Publisher, self-promotion)
 @param	showOrClick (PUB & Self-promo) YES for impression NO for click
 @param	IntOrExt (PUB & Self-promo) YES for Int NO for Ext
 @param	idCampaign (PUB & Self-promo)
 @param	creation (PUB)
 @param	variant (PUB)
 @param	format (PUB & Self-promo)
 @param adEmplacement ()
 @param	adEmplacementDetail ()
 @param annonceur (PUB)
 @param idProduct (Sel-promo)
 This function has parameters linked to Publisher and Self-promotion, put nil for parameters not used for what you are tagging (-> creation, variant, adEmplacement, adEmplacementDetail and annonceur must be nil if you're tagging Self-promotion. idProduct mus be nil if you are tagging Publisher)
 */
-(void)	 xt_ad_noat:(BOOL)showOrClick
      andIsIntOrExt:(BOOL)IntOrExt
      andIdCampaign:(NSString*)idCampaign
      andIdCreation:(NSString*) creation
         andVariant:(NSString*)variant
          andFormat:(NSString*)format
     andEmplacement:(NSString*)adEmplacement
andEmplacementDetail:(NSString*)adEmplacementDetail
       andAnnonceur:(NSString*)annonceur
       andIdProduct:(NSString*)idProduct;

/*!
 @method
 \brief xt_rm like javascript (&type=&s2=&p=&plyr=&a=&rfsh=&m1=&m3=&m4=&m5=&m6=&m7=&m8=) (Rich Media)
 @param media_type Media type
 @param level2 level 2 tag
 @param mediaName Media Name
 @param playerId Player ID
 @param media_action Media action 
 @param refreshTime Refresh time
 @param mediaDuration Media duration (sec)
 @param media_quality Media quality, enum mediaquality
 @param media_stream Media stream, enum mediaStream
 @param media_source Media source
 @param liveOrClip YES for live, No for clip
 @param mediaSize Media size (Ko) 
 @param media_extension Media extension
 */
-(void)xt_rm:(mediaType)media_type 
	 andLevel2:(NSString*)level2 
 andPlayerId:(NSString*)playerId
  andMediaName:(NSString*)mediaName 
	 andAction:(mediaAction)media_action
andRefreshTime:(NSString*)refreshTime
andMediaDuration:(NSString*)mediaDuration
andMediaQuality:(mediaQuality)media_quality
andMediaStream:(mediaStream)media_stream
andMediaSource:(mediaSource)media_source
 andLiveOrClip:(BOOL)liveOrClip
  andMediaSize:(NSString*)mediaSize
andMediaExtension:(mediaExtension)media_extension;

/*!
 @function
 \brief Add product for a command (SalesTracker)
 @param productName Product name
 @param quantity Product quantity
 @param price Unit price (before tax)
 @param priceTaxes Unit price (tax included)
 @param taxes Tax
 @param dsc Discount amount (before tax)
 @param dscc Discount amount (tax included)
 @param discountCode Discount code
 */
-(void)xt_addProduct:(NSString*)productName
		 andQuantity:(NSString*)quantity
 andPriceWithoutTaxe:(NSString*)price
   andPriceWithTaxes:(NSString*)priceTaxes
			andTaxes:(NSString*)taxes
andDiscountBeforeTaxes:(NSString*)dsc
andDiscountWithTaxes:(NSString*)dscc
	 andDiscountCode:(NSString*)discountCode;
	 
/*! @property  params */	 
@property (retain,nonatomic) 	NSMutableDictionary *params;
/*! @property  refreshTimer */
@property (retain,nonatomic) 	NSTimer *refreshTimer;
@end


