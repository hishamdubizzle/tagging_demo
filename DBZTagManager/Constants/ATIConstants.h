//
//  ATIConstants.h
//  DubizzleHorizontal
//
//  Created by Fawad Suhail on 8/17/14.
//  Copyright (c) 2014 dubizzle. All rights reserved.
//

#import <Foundation/Foundation.h>
//*****************
// ATI PARAMS
//*****************

static NSString *FIELD_LANGUAGE = @"language";
static NSString *FIELD_COUNTRY = @"country";
static NSString *FIELD_CITY = @"city";
static NSString *FIELD_ACTION_TYPE = @"action_type";
static NSString *FIELD_NEIGHBORHOOD = @"neighbourhood";
static NSString *FIELD_LISTER_TYPE = @"lister_type";
static NSString *FIELD_LISTING_SECTION = @"listing_section";
static NSString *FIELD_LISTING_SUBSECTION = @"listing_subsection";
static NSString *FIELD_LISTING_SUBSUBSECTION = @"listing_subsubsection";
static NSString *FIELD_LISTING_SUBSUBSUBSECTION = @"listing_subsubsubsection";
static NSString *FIELD_LISTING_ID = @"listing_id";
static NSString *FIELD_USER_ID = @"lister_num";
static NSString *FIELD_APP_VERSION = @"version";
static NSString *FIELD_LISTING_SOURCE = @"listing_source";
static NSString *FIELD_LISTER_ID = @"lister_id";
static NSString *FIELD_KEYWORD = @"keyword";
static NSString *FIELD_FILTERS = @"filters";
static NSString *FIELD_NB_RESULTS = @"nb_results";
static NSString *FIELD_CUSTOM_PAYLOAD = @"custom_payload";
static NSString *FIELD_FUNNEL_SECTION = @"funnel_section";
static NSString *FIELD_NUMBER_OF_PHOTOS = @"number_of_photos";
static NSString *FIELD_POSITION = @"pos";
static NSString *FIELD_FUNNEL_SUBSECTION = @"funnel_subsection";
static NSString *FIELD_FUNNEL_SUBSUBSECTION = @"funnel_subsubsection";

//*****************
// CUSTOM PARAMETER
//*****************
static NSString *ATICustomCriteriaLanguage = @"01";
static NSString *ATICustomCriteriaCountry = @"02";
static NSString *ATICustomCriteriaCity = @"03";
static NSString *ATICustomCriteriaActionType = @"04";
static NSString *ATICustomCriteriaNeighbourhood = @"05";
static NSString *ATICustomCriteriaPosterType = @"06";
static NSString *ATICustomCriteriaAdCat = @"07";
static NSString *ATICustomCriteriaAdSubCat = @"08";
static NSString *ATICustomCriteriaAdSubSubCat = @"09";
static NSString *ATICustomCriteriaAdSubSubSubCat = @"10";
static NSString *ATICustomCriteriaAdID = @"11";
static NSString *ATICustomCriteriaPosterID = @"12";
static NSString *ATICustomCriteriaAppVersion = @"14";
static NSString *ATICustomCriteriaListingSource = @"20";

//****************
// ATI ACTION TYPE
//****************
static NSString *ATIActionTypeEmail = @"lead_sent_email";
static NSString *ATIActionTypeCall = @"lead_sent_call";
static NSString *ATIActionTypeSMS = @"lead_sent_sms";
static NSString *ATIActionTypeChat = @"lead_sent_chat";
static NSString *ATIActionTypeLoaded = @"listing_loaded";
static NSString *ATIActionTypePosted = @"listing_posted";
static NSString *ATIActionTypeJobApplied = @"lead_applied_applicant";
static NSString *ATIActionTypeJobAppliedExternal = @"lead_sent_external";

//*************
// POSTER TYPES
//*************
static NSString *ATIPosterTypeFreeLister = @"free_lister";
static NSString *ATIPosterTypeAgencyLister = @"agency_lister";

//***************
// LISTING SOURCE
//***************
static NSString *ATIListingSourceAgency = @"agency";
static NSString *ATIListingSourceFreeOrganic = @"free_organic";

//****
// LPV
//****

static NSString *ATILPVErrorPage = @"LPV_error_page";
static NSString *ATIBrowseLPV = @"Browse_LPV";
static NSString *ATIBrowseLPVPageLoad = @"Page Load";
static NSString *ATISearchLPV = @"Search_LPV";

static NSString *ATIAlgoliaPageName = @"NewSearchResults";
static NSString *ATIAlgoliaNewSearch = @"algolia_results_view";
static NSString *ATIAlgoliaUnvalidKey = @"ATIAlgoliaUnvalidKey";
static NSString *ATIAlgoliaSearchRateLimitReached = @"ATIAlgoliaSearchRateLimitReached";
static NSString *ATIListingViewHorizontallySlideCellFeaturedAd = @"listing_view_horizontally_slide_cell_featured_ad";
static NSString *ATIListingViewHorizontallySlideCellNonFeaturedAd = @"listing_view_horizontally_slide_cell_non_featured_ad";
static NSString *ATIDidAnimatedBouncingSlidingCell = @"did_animated_bouncing_sliding_cell";

//******
// PAGES
//******
static NSString *ATIPageHomescreen = @"Home";
static NSString *ATIPageMenuPanel = @"User menu";
static NSString *ATIPageSearchPanel = @"category_browser";
static NSString *ATIPageFilterPanel = @"Search filters";
static NSString *ATIPageItemDetailActivity = @"DPV";
static NSString *ATIPageItemPhotoViewer = @"DPV photo viewer";
static NSString *ATIPageItemDescriptionViewer = @"DPV description viewer";
static NSString *ATIPageResetPassword = @"Reset password";
static NSString *ATIPageLogin = @"Login";
static NSString *ATIPageRegistration = @"Registration";
static NSString *ATIPagePlaceAnAd = @"Place an ad";
static NSString *ATIPageFavourites = @"Favourites";
static NSString *ATIPageSavedSearches = @"Saved searches";
static NSString *ATIPageRecentSearches = @"Recent searches";
static NSString *ATIPageTerms = @"Terms & Conditions";
static NSString *ATIPageReportAd = @"Report ad";
static NSString *ATIPageSendEmailLoggedIn = @"Reply ad logged in";
static NSString *ATIPageSendEmailNotLoggedIn = @"Reply ad not logged in";
static NSString *ATIPageEmailSent = @"Email sent";
static NSString *ATIPageSearchAllCategories = @"Search all categories";
static NSString *ATIPageCall = @"Sure to call"; //call action needs to be a pageview so that a sales-funnel can be built on AT Internet
static NSString *ATIPageSMS = @"Send SMS"; //sms action needs to be a pageview so that a sales-funnel can be built on AT Internet
static NSString *ATIPageAlertLogInNeeded = @"Alert log in";
static NSString *ATIPageAlertNoConnection = @"Alert no connection";
static NSString *ATIPageAlertAdDeleted = @"Alert ad deleted";
static NSString *ATIPageAlertAdExpired = @"Alert ad expired";
static NSString *ATIPageAlertNoResultFound = @"Alert no result found";
static NSString *ATIPageAlertLoggedOut = @"Alert logged out";
static NSString *ATIPageCallMade = @"call_sent";
static NSString *ATIPageCallCancelled = @"call_cancelled";
static NSString *ATIFeedback = @"feedback";
static NSString *ATIFBScreen = @"facebook login screen";
static NSString *ATIFBAction = @"facebook_connect";
static NSString *ATINativePAAComplete = @"ad_posted";
static NSString *ATISearchCategory = @"search_category";
static NSString *ATISortButtonAction = @"results_sort_action";
static NSString *ATISaveSearchAction = @"save_search";
static NSString *ATIResultsViewAction = @"results_view_action";
static NSString *ATIReplyAdPage = @"email_screen";
static NSString *ATIPublicProfilePage = @"Public_profile_page";
static NSString *ATIPublicProfilePageLiveListingTapped = @"Live_listing_tapped";

static NSString *ATIFilterButtonActionNoResult = @"results_filter_action_no_result";
static NSString *ATISaveSearchButtonActionNoResult = @"save_search_action_no_result";
static NSString *ATISortButtonActionNoResult = @"results_sort_action_no_result";
static NSString *ATIResultsViewButtonActionNoResult = @"results_view_type_action_no_result";
static NSString *ATIResultsViewButtonActionChangeFilter = @"results_view_type_action_change_filter";

//************
// SAVE SEARCH ALert Me
//***********
static NSString *ATIAlertMeSaveSearchAction = @"save_search_clicked";
static NSString *ATIAlertMeEmailAlertAction = @"email_alerts_subscription_clicked";
static NSString *ATIAlertEmailAlertSuccess = @"email_alerts_subscription_success";
//**********
// REPORT AD
//**********

static NSString *ATIReportAdMenuButtonClicked = @"report_ad_menu_button_clicked";

static NSString *ATIPageReportAdFraud = @"report_ad_fraud";

static NSString *ATIPageReportAdSpamCommercial = @"report_ad_spam_commercial";
static NSString *ATIPageReportAdSpamOffensive = @"report_ad_spam_offensive";
static NSString *ATIPageReportAdSpamIrrelevant = @"report_ad_spam_irrelevant";
static NSString *ATIPageReportAdSpamOther = @"report_ad_spam_other";

static NSString *ATIPageReportAdMiscategorized = @"report_ad_miscategorized";

static NSString *ATIPageReportAdRepetitiveListing = @"report_ad_repetitive_listing";

static NSString *ATIPageReportAdCopyrightInfringement = @"report_ad_copyright_infringement";

static NSString *ATIPageReportAdPropertyNotAvailable = @"report_ad_property_not_available";

static NSString *ATIPageReportAdIncorrectPrice = @"report_ad_incorrect_price";

static NSString *ATIReportAdSendSuccess = @"send_success";

//**********

//*********
// YOU MENU
//*********
static NSString *ATICitySelection = @"City Selector";
static NSString *ATICountrySelection = @"Country Selector";
static NSString *ATICurrencySelection = @"Currency Selector";
static NSString *ATILogoutAction = @"logout_action";
static NSString *ATILoginActionSubmit = @"login_submission";
static NSString *ATILoginSuccess = @"login_success";
//*********

//**********************************
// FACEBOOK LOGIN (GOOGLE ANALYTICS)
//**********************************
static NSString *ATIFacebookLoginFailure = @"facebook_login_failure";
static NSString *ATIFacebookLoginKombiFailure = @"facebook_login_kombi_failure";
static NSString *ATIFacebookLoginFailurePermissionsNotGranted = @"facebook_login_failure_permission_not_granted";
static NSString *ATIFacebookLoginFailureGraphAPIFailed = @"facebook_login_failure_graph_api_failed";
static NSString *ATIFacebookLoginFailureGraphAPICannotFetchEmail = @"facebook_login_failure_graph_api_cannot_fetch_email";
static NSString *ATIFacebookLoginFailureEmailMismatch = @"facebook_login_failure_email_mismatch";

static NSString *ATIFacebookLoginTrustMessageTouch = @"facebook_login_trust_message_touch";
//**********************************

//***************
// FACEBOOK LOGIN
//***************
static NSString *ATIFacebookLoginButtonClicked = @"facebook_login_button_clicked";
static NSString *ATIFacebookLoginSuccessNewUserRegistered = @"facebook_login_success_new_user_registered";

static NSString *ATIFacebookLoginSuccess = @"facebook_login_success";
static NSString *ATIFacebookLoginError = @"facebook_login_error";
static NSString *ATIFacebookLoginConflict = @"facebook_login_conflict";
static NSString *ATIFacebookLoginRegistered = @"facebook_login_registered";
//***************
//**************
// EMAIL LOGIN
//*************

static NSString *ATIEmailLoginSuccess = @"email_login_success";
static NSString *ATIEmailLogin = @"email_login";
static NSString *ATIResetPassword = @"reset_password";
static NSString *ATIEmailLoginSuccessNewUserRegistered = @"email_new_user_registered";
static NSString *ATINameEnteredReg = @"name_entered_registration";
static NSString *ATIEmailEnteredReg = @"email_entered_registration";
static NSString *ATIPasswordEnteredReg = @"password_entered_registration";
static NSString *ATIEmailEntered = @"email_entered";
static NSString *ATIPasswordEntered = @"password_entered";
static NSString *ATIVerficationEmail = @"verification_email_sent";
static NSString *ATIForgotPasswordEmail = @"forgot_password_email_sent";

//*********************
// PROFILE PRIVACY EDIT
//*********************
static NSString *ATIProfilePrivacyCheckBoxClicked = @"profile_privacy_check_box_clicked";
static NSString *ATIProfilePrivacySwitchToPrivate = @"profile_privacy_switch_to_private";
static NSString *ATIProfilePrivacySwitchToPublic = @"profile_privacy_switch_to_public";
//*********************

//********
// PROFILE
//********
static NSString *PUBLIC_PROFILE_VIEW = @"public_profile_viewed";
static NSString *ATIProfileChangePasswordButtonClicked = @"profile_change_password_button_clicked";

static NSString *ATIProfilePictureEditButtonClicked = @"profile_picture_edit_button_clicked";
static NSString *ATIProfilePictureViewButtonClicked = @"profile_picture_view_button_clicked";
static NSString *ATIProfilePictureTakeNewPictureFromCameraButtonClicked = @"profile_picture_take_new_picture_from_camera_button_clicked";
static NSString *ATIProfilePictureTakeNewPictureFromCameraUnavailableFailure = @"profile_picture_take_new_picture_from_camera_unavailable_failure";
static NSString *ATIProfilePictureChooseNewPictureFromLibraryButtonClicked = @"profile_picture_choose_new_picture_from_library_button_clicked";
static NSString *ATIProfilePictureEditCancelButtonClicked = @"profile_picture_edit_cancel_button_clicked";

static NSString *ATIProfilePictureUploadNewPictureSuccess = @"profile_picture_upload_new_picture_success";
static NSString *ATIProfilePictureUploadNewPictureFailure = @"profile_picture_upload_new_picture_failure";

static NSString *ATIProfileEmailEditButtonClicked = @"profile_email_edit_button_clicked";
static NSString *ATIProfilePhoneEditButtonClicked = @"profile_phone_edit_button_clicked";
//********

static NSString *ATIRegisterSuccess = @"register_success";
static NSString *ATIRegisterSubmission = @"register_submission";

//****
// PAA
//****
static NSString *ATIPAACongratsPage = @"paa_congrats";
static NSString *ATIPAACategoryAction = @"paa_pick";
static NSString *ATIPAAPostAction = @"posted";
static NSString *ATIPAAAttributesPage = @"paa_attributes";
static NSString *ATIPAALogin = @"paa_login";
static NSString *ATIPAAFBConnect = @"paa_fbconnect";
static NSString *ATIPAAForgotPassword = @"paa_forgot password";
static NSString *ATIPAARegister = @"paa_register";
static NSString *ATIPAAPhotoPage = @"paa_photo_pick";
static NSString *ATIPAACamera = @"paa_photo_pick_camera";
static NSString *ATIPAALibrary = @"paa_photo_pick_library";

//************
// DPV ACTIONS
//************
static NSString *ATIClose = @"close";
static NSString *ATIEditAction = @"edit_ad_action";
static NSString *ATIEditPage = @"edit_ad_page";
static NSString *ATIDeleteAdAction = @"delete_action";
static NSString *ATIDeleteConfirm = @"delete_ad_confirm";
static NSString *ATIDeleteAdPage = @"delete_ad_page";
static NSString *ATIDeleteAdUndo = @"delete_ad_undo";
static NSString *ATIDeleteCancel = @"delete_ad_cancel";
static NSString *ATIAdFavorited = @"add-to-favourites";
static NSString *ATIAdUnFavorited = @"delete-from-favourites";
static NSString *ATILPVAdFavorited = @"LPV-add-to-favourites";
static NSString *ATILPVAdUnFavorited = @"LPV-delete-from-favourites";
static NSString *ATIPageSetup = @"setup";
static NSString *ATIPageSearchResults = @"search_results";
static NSString *ATISortNewestOldest = @"sort_date_newest_oldest";
static NSString *ATISortOldestNewest = @"sort_date_oldest_newest";
static NSString *ATISortHighestLowest = @"sort_price_highest_lowest";
static NSString *ATISortLowestHighest = @"sort_price_lowest_highest";
static NSString *ATIUAECongratsPage = @"paa_congrats_uae";
static NSString *ATIResultsClassicView = @"classic_results_view";
static NSString *ATIResultsImageView = @"image_results_view";
static NSString *ATIResultsMapView = @"map_results_view";
static NSString *ATIStreetViewToggle = @"street_view_toggled";
static NSString *ATIMapViewToggle = @"map_view_toggled";

//****************************
// BOTTOM BAR MENU OPTIONS DPV
//****************************
static NSString *ATICallPressed = @"call_pressed";
static NSString *ATISMSPressed = @"sms_pressed";
static NSString *ATIEmailPressed = @"email_pressed";
static NSString *ATIChatPressed = @"chat_pressed";
static NSString *ATIEmailSent = @"email_sent";
static NSString *ATISMSSent = @"sms_sent";

static NSString *ATI_TAG_PAGE_VALIDATE_SMS_COMPLETE = @"paa_sms_completion";
static NSString *ATI_TAG_PAGE_VALIDATE_SMS_SHOWN = @"paa_sms_validation";

//*********
// YOUR ADS
//*********
static NSString *ATIPageMyAds = @"My Ads";
static NSString *ATIYourAdsDropdownMenu = @"Your_ads_dropdown_menu_click";

static NSString *ATIYourAdsRefreshAdSelection = @"Your_ads_refresh_ad_selection_click";
static NSString *ATIYourAdsFeatureAdSelection = @"Your_ads_feature_ad_selection_click";
static NSString *ATIYourAdsDeleteAdSelection = @"Your_ads_delete_ad_selection_click";
static NSString *ATIYourAdsUpgradeAdSelection = @"Your_ads_upgrade_ad_selection_click";

static NSString *ATIYourAdsRefreshAdConfirmation = @"Your_ads_refresh_ad_confirmation_click";
static NSString *ATIYourAdsFeatureAdConfirmation = @"Your_ads_feature_ad_confirmation_click";
static NSString *ATIYourAdsDeleteAdConfirmation = @"Your_ads_delete_ad_confirmation_click";

static NSString *ATIYourAdsRefreshAllConfirmation = @"Your_ads_refresh_all_confirmation_click";
static NSString *ATIYourAdsFeatureAllConfirmation = @"Your_ads_feature_all_confirmation_click";
static NSString *ATIYourAdsDeleteAllConfirmation = @"Your_ads_delete_all_confirmation_click";

static NSString *ATIYourAdsRefreshAdCancelation = @"Your_ads_refresh_ad_cancelation_click";
static NSString *ATIYourAdsFeatureAdCancelation = @"Your_ads_feature_ad_cancelation_click";
static NSString *ATIYourAdsDeleteAdCancelation = @"Your_ads_delete_ad_cancelation_click";

static NSString *ATIUpgradeAction = @"Your_ads_upgrade_ad_action";
static NSString *ATIUpgradePage = @"Your_ads_upgrade_ad_page";

//***********
// JOBS APPLY
//***********
static NSString *JOBS_APPLY_DPV_CLICK = @"jobs_apply_dpv_click";
static NSString *JOBS_APPLY_LPV_CLICK = @"jobs_apply_lpv_click";
static NSString *JOBS_APPLY_SENT_CONGRATS = @"jobs_apply_sent_congrats";
static NSString *JOBS_APPLY_ATTACH_CV = @"jobs_apply_attach_cv";
static NSString *JOBS_APPLY_ATTACH_CV_FAIL = @"jobs_apply_attach_cv_failed";
static NSString *JOBS_APPLY_FAILED_VALIDATION = @"jobs_apply_failed_validation_%@";
static NSString *VIEW_PROFILE = @"profile_viewed";
static NSString *PROFILE_UPDATED = @"profile_updated";
static NSString *JOBS_APPLY_FILE_SOURCE = @"jobs_apply_file_from_%@";
static NSString *JOB_APPLY_PAGE = @"job_apply_screen";

static NSString *FIELD_FIRST_NAME = @"first_name";
static NSString *FIELD_LAST_NAME = @"last_name";
static NSString *FIELD_GENDER = @"gender";
static NSString *FIELD_DOB = @"date_of_birth";
static NSString *FIELD_NATIONALITY = @"nationality";
static NSString *FIELD_CAREER_LEVEL = @"career_level";
static NSString *FIELD_EDUCATION_LEVEL = @"education_level";
static NSString *FIELD_CURRENT_LOCATION = @"current_location";
static NSString *FIELD_CURRENT_POSITION = @"current_position";
static NSString *FIELD_CURRENT_EMPLOYER = @"current_employer";
static NSString *FIELD_EXPERIENCE_LEVEL = @"experience_level";

//****************
// FACEBOOK EVENTS
//****************
static NSString *FACEBOOK_PAA_OPENED = @"paa_opened";
static NSString *FACEBOOK_PAA_COMPLETE = @"paa_complete";
static NSString *FACEBOOK_SMS_LEAD = @"sms_lead";
static NSString *FACEBOOK_EMAIL_LEAD = @"email_lead";
static NSString *FACEBOOK_CALL_LEAD = @"call_lead";
static NSString *FACEBOOK_CHAT_LEAD = @"chat_lead";
static NSString *FACEBOOK_LEAD = @"lead";
static NSString *FACEBOOK_SEARCH = @"search_category";

//*******************
// PAA BUTTON PRESSED
//*******************
static NSString *PAA_BUTTON_PRESSED = @"paa_pressed";

static NSString *CURRENCY_CONVERTER_SELECT = @"currency_converter_select_%@";

// new home page tags
static NSString *HOME_PAGE_CATEGORY_TAP = @"tap_home_%@_button";
static NSString *HOME_PAGE_ACCOUNT_BUTTON = @"tap_home_account";
static NSString *HOME_PAGE_BOTTOM_BAR_ACCOUNT = @"tap_home_bottom_bar";
static NSString *HOME_PAGE_PLACE_AD_HOME_BUTTON = @"paa_pressed_home_page";
static NSString *HOME_PAGE_PLACE_AD_BOTTOM_BAR = @"paa_pressed_bottom_bar";
static NSString *HOME_PAGE_WHATS_HOT = @"whats_hot_screen";
static NSString *HOME_PAGE_SCREEN = @"home_screen";
static NSString *HOME_PAGE_BROWSE_BOTTOM_BAR = @"tap_browse_bottom_bar";



static NSString *HOME_PAGE_BROWSE_CAT_LPV = @"Browse_CatLPV";
static NSString *HOME_PAGE_CHANGE_LOCATION_LPV = @"ChangeLocationLPV";
static NSString *HOME_PAGE_LISTVIEW = @"Home_ConListview";

static NSString *HOME_PAGE_SET_LOCATION = @"Set Location";
static NSString *HOME_PAGE_SET_LOCATION_CANCEL = @"Set_Location_Cancel";

static NSString *HOME_PAGE_CHOOSE_LOCATION_AUTOMATIC = @"Chooselocation_Automatic";
static NSString *HOME_PAGE_CHOOSE_LOCATION_ON_MAP = @"Chooselocation_On_Map";
static NSString *HOME_PAGE_CHOOSE_LOCATION_ON_MAP_YES = @"Chooselocation_On_Map_Yes";
static NSString *HOME_PAGE_CHOOSE_LOCATION_NEIGHBOURHOOD = @"Chooselocation_Neighbourhood";
static NSString *HOME_PAGE_CHOOSE_LOCATION_NEIGHBOURHOOD_YES = @"Chooselocation_Neighbourhood_Yes";

static NSString *HOME_PAGE_LOCATION_PERMISSION_YES = @"Location Permission_Yes";
static NSString *HOME_PAGE_LOCATION_PERMISSION_NO = @"Location Permission_No";

static NSString *HOME_PAGE_PAGE_LOAD = @"Page Load";

static NSString *HOME_PAGE_MAP_LOCATION_PERMISSION_SUCCESS = @"Maplocation";
static NSString *HOME_PAGE_NEIGHBOURHOOD_LOCATION_SUCCESS = @"NHLocation_";

//************
// SIMILAR ADS
//************
static NSString *SIMILAR_ADS_CLICK = @"similar_ads_click";
static NSString *SIMILAR_ADS_AGENT_CLICK = @"similar_ads_agent_click";
static NSString *SIMILAR_ADS_SCROLL_HORIZONTALLY = @"similar_ads_scroll_horizontally";
static NSString *SIMILAR_ADS_AGENT_SCROLL_HORIZONTALLY = @"similar_ads_agent_scroll_horizontally";
static NSString *SIMILAR_ADS_VISIBLE_SCROLL_VERTICALLY = @"similar_ads_visible_scroll_vertically";
static NSString *SIMILAR_ADS_AGENT_VISIBLE_SCROLL_VERTICALLY = @"similar_ads_agent_visible_scroll_vertically";

//**********
//LOGIN PAGE
//**********
static NSString *CHECKBOX_REMEMBER_MY_ACCOUNT_TICK = @"checkbox_remember_my_account_tick";
static NSString *CHECKBOX_REMEMBER_MY_ACCOUNT_UNTICK = @"checkbox_remember_my_account_untick";
static NSString *TOUCH_ID_AUTHENTICATION_SUCCESS = @"touch_id_authentication_success";
static NSString *TOUCH_ID_AUTHENTICATION_FAILURE = @"touch_id_authentication_failure";

//*************
//LOGIN ALERT
//*************
static NSString *LOGIN_ALERT = @"alert_login";

//************
// CHATS
//************
static NSString *CHATROOM_PAGE = @"chatroom";

static NSString *CHATROOM_INITIATE_ANONYMOUS = @"chat_initiated_anonymous";
static NSString *CHATROOM_INITIATE_LOGGED_USER = @"chat_initiated_logged_in";
static NSString *CHATROOM_INITIATED = @"chat_initiated";
static NSString *CHAT_BLOCK = @"chat_blocked";
static NSString *CHAT_UNBLOCK = @"chat_unblocked";
static NSString *CHAT_PUSH_OPENED = @"chat_push_opened";
static NSString *CHAT_PUSH_INTERNAL_OPENED = @"chat_internal_push_opened";
static NSString *CHAT_SELLER_REPLIED = @"chat_seller_replied";
// location
static NSString *CHAT_LOCATION_TAPPED = @"chat_location_tapped";
static NSString *CHAT_LOCATION_SENT = @"chat_location_sent";
static NSString *CHAT_LOCATION_RECEIVER_VIEWED = @"chat_location_receiver_viewed";

//**************
// CHAT ALERT
//**************
static NSString *CHAT_MODAL_OPEN_SCREEN = @"modal_open";
static NSString *CHAT_MODAL_CANCEL_ACTION = @"click_see_my_chats_cancel";
static NSString *CHAT_MODAL_YOUR_CHATS_ACTION = @"click_see_my_chats";

//****************
// MINI SURVEY
//****************
static NSString *MINI_SURVEY_OPEN = @"mini_survey";
static NSString *MINI_SURVEY_SUBMIT = @"mini_survey_submit";


//****************
// DPV PROFILE
//****************
static NSString *DPV_PROFILE_LOGIN_ACTION = @"LoginSeeSellerProfile";
static NSString *DPV_PROFILE_SEE_SELLER_TAP_ACTION   = @"SeeSellerProfile";

//******************
// New Home page tag
//******************
static NSString *HOMEPAGE_RECENT_SEARCH_SEE_MORE = @"home_see_more";
static NSString *HOMEPAGE_TRENDING_SEE_MORE = @"home_trending_see_more";
static NSString *HOMEPAGE_FLOATING_PAA_PRESSED = @"floating_paa_pressed";
static NSString *HOMEPAGE_RECENT_SEARCH_LISTING_CLICK = @"home_recent_search";
static NSString *HOMEPAGE_TRENDING_LISTING_CLICK = @"home_trending";

//*****************
// RAMADAN
//*****************
static NSString *RAMADAN_MODAL = @"ramadan_modal";
static NSString *RAMADAN_MODAL_PAA = @"Ramadan_give_PAA_button";

#pragma mark - Update Prompt

static NSString *UPDATE_PROMPT_DISPLAYED   = @"update_prompt_displayed";
static NSString *UPDATE_PROMPT_DISMISSED   = @"update_prompt_dismissed";
static NSString *UPDATE_PROMPT_HOME_ACTION = @"update_prompt_home_action";
static NSString *UPDATE_PROMPT_MENU_ACTION = @"update_prompt_menu_action";

#pragma mark - UPDATE APP SPLASH SCREEN

static NSString *UPDATE_APP_SPLASH_SCREEN_DISPLAYED = @"update_app_splash_screen";
static NSString *UPDATE_APP_SPLASH_SCREEN_CLICKED = @"update_app_splash_screen_clicked";
static NSString *UPDATE_APP_SPLASH_SCREEN_CANCEL = @"update_app_splash_screen_cancel";

// JOBS WANTED
static NSString *JOBS_WANTED_CONTACT = @"JW_EmailSales";
static NSString *JOBS_WANTED_SALES_MODAL = @"JW_SalesModal";

// TUNE Chat lead
static NSString *TUNE_CHAT_LEAD = @"chat_sent";
static NSString *TUNE_CHAT_MAKE_AN_OFFER_LEAD = @"offer_sent";

// Facebook tag additions
static NSString* FB_TAG_CONSTANT_L1 = @"L1";
static NSString* FB_TAG_CONSTANT_L2 = @"L2";
static NSString* FB_TAG_CONSTANT_L3 = @"L3";
static NSString* FB_TAG_CONSTANT_L4 = @"L4";
static NSString* FB_TAG_CONTANT_LISTING_ID = @"listing_id";

// BANNER
static NSString *BANNER_ACTION = @"banner_action";

// SAVED SEARCH
static NSString *SAVE_SEARCH_GOT_IT = @"savesearch_gotit";
static NSString *SAVE_SEARCH_ALERT = @"savesearch_confirmed";
static NSString *SAVE_SEARCH_ALERT_IM_OK = @"savesearch_IMOK";
static NSString *SAVE_SEARCH_ALERT_UPDATE_ALERTS = @"savesearch_updatealerts";
static NSString *SAVE_SEARCH_ALLOW_PUSH = @"savesearch_Allowpush";
static NSString *SAVE_SEARCH_DISALLOW_PUSH = @"savesearch_DisablePush";
static NSString *SAVE_SEARCH_ALLOW_EMAIL = @"savesearch_AllowEmail";
static NSString *SAVE_SEARCH_DISALLOW_EMAIL = @"savesearch_DisableEmail";
static NSString *SAVE_SEARCH_DELETE_ALL = @"savesearch_DeleteAll";
static NSString *SAVE_SEARCH_DELETE = @"delete_saved_search_button";

// MAKE AN OFFER
static NSString *MAKE_AN_OFFER_SCREEN = @"make_an_offer_screen";
static NSString *MAKE_AN_OFFER_INITIATED = @"make_an_offer_chat_initiated_logged_in";
static NSString *MAKE_AN_OFFER_LOW_BID = @"make_an_offer_chat_low_bid";
static NSString *MAKE_AN_OFFER_CONFIRM = @"make_an_offer_button_confirm_clicked";
static NSString *MAKE_AN_OFFER_LEAD_LOW_BID = @"make_an_offer_chat_initiated_logged_in_low_bid"; // click name
static NSString *MAKE_AN_OFFER_RETRY = @"make_an_offer_chat_retry";
static NSString *MAKE_AN_OFFER_DPV_BUTTON = @"make_an_offer_DPV_button_clicked";

//CONTENT FIRST HOME SCREEN AB TEST
static NSString *ABTEST_ORIGINAL = @"control_cf";
static NSString *ABTEST_WITH_RECENT_SEARCH= @"variation_cf_with_recent";
static NSString *ABTEST_WITHOUT_RECENT_SEARCH = @"variation_cf_without_recent";

//CONTENT FIRST INFINITY HOME SCREEN
static NSString *ABTEST_CONTENT_FIRST = @"content_first";
static NSString *ABTEST_CONTROL = @"control";
static NSString *CLICK_RECENT_SEARCH =  @"home_recent_search";
static NSString *CLICK_SEARCH_BAR = @"home_top_search";
static NSString *CLICK_CATEGORY_ICON = @"home_icon_";
static NSString *CLICK_HOME_TAB = @"home_bottom_home";
static NSString *CLICK_PAA_TAB = @"home_botton_paa";
static NSString *CLICK_CHAT_TAB = @"home_bottom_chat";
static NSString *CLICK_PROFILE_TAB = @"home_bottom_profie";


// BANNER 2017
static NSString *BANNER_LOAD = @"GuessChatWin";
static NSString *BANNER_CLICK = @"GuessChatWinClick";

// NAVIGATION SHELL PAGES
static NSString *NS_PAGE_CHAT = @"Mychats";
static NSString *NS_PAGE_NOTIFICATIONS = @"MyNotifications";
static NSString *NS_PAGE_ACCOUNT = @"Myaccount";

// NOTIFICATION HUB TRACKERS
static NSString *NH_HUB_OPENED = @"notificationHubOpened";
static NSString *NH_NOTIFICATION_OPENED = @"notificationOpened";
static NSString *NH_USER_BADGE_COUNT = @"userHasBadgeCount";

// DFP
static NSString *ATIDPFAdonDPV = @"dfp on dpv";

//**********************
// CHAT NOTIFICATIONS
//***********************
static NSString *CHAT_BUYER = @"chat_buyer_messaged";
static NSString *CHAT_SELLER = @"chat_seller_replied";
static NSString *CHAT_MESSAGE = @"chat_message_sent";
static NSString *FUNNEL_PAGE = @"funnel_page";

//***********
// APP ERRORS
//***********
static NSString *ERROR_APP_DELEGATE = @"error_app_delegate";

static NSString *ERROR_BL_BUILDING = @"error_bl_building";
static NSString *ERROR_CORE_DATA_FETCH_BUILDING = @"error_core_data_fetch_building";

static NSString *ERROR_CHAT_MEDIA_VC = @"chat_media_vc";

static NSString *ERROR_DEEPLINK_DPV = @"deeplink_dpv";

static NSString *ERROR_IMAGE_MANAGER = @"error_image_manager";
static NSString *ERROR_IMAGE_MANAGER_CREATE_DIR_FILE_MANAGER = @"error_image_manager_create_dir_file_manager";

static NSString *ERROR_REGEX = @"regex";

static NSString *ERROR_CATEGORY_NSSTRING = @"error_category_nsstring";
static NSString *ERROR_VALID_EMAIL_ADDRESS = @"valid_email_address";


//***************
// Mr Usta
//***************

// DPV Banner //

static NSString * ATI_MR_USTA_ENTRY_DPV = @"usta_DPV_banner";

// Moving Details
static NSString * ATI_MR_USTA_MOVING_DETAILS_PAGE = @"usta_details_page";
static NSString * ATI_MR_USTA_MOVING_DETAILS_PAGE_FROM = @"usta_from_field";
static NSString * ATI_MR_USTA_MOVING_DETAILS_PAGE_TO = @"usta_to_field";
static NSString * ATI_MR_USTA_MOVING_DETAILS_PAGE_WHEN = @"usta_when_field";
static NSString * ATI_MR_USTA_MOVING_DETAILS_PAGE_HOUSETYPE = @"usta_housetype_field";
static NSString * ATI_MR_USTA_MOVING_DETAILS_PAGE_NO_OF_ROOMS = @"usta_bedroom_field";
static NSString * ATI_MR_USTA_MOVING_DETAILS_PAGE_NEXT = @"usta_next_button";

// Contact Details
static NSString * ATI_MR_USTA_CONTACT_DETAILS_PAGE = @"usta_contact_page";
static NSString * ATI_MR_USTA_CONTACT_DETAILS_PAGE_SCHEDULE = @"usta_schedule_field";
static NSString * ATI_MR_USTA_CONTACT_DETAILS_PAGE_GET_QUOTE = @"usta_get_quotes";
static NSString * ATI_MR_USTA_CONTACT_DETAILS_PAGE_CONFIRM_PAGE = @"usta_confirm_phone";

// Success Page
static NSString * ATI_MR_USTA_SUCCESS_PAGE = @"usta_success_page";

static NSString* mrUstaNo = @"8008782";
static NSString* countryCode = @"971";

@interface ATIConstants : NSObject

@end
