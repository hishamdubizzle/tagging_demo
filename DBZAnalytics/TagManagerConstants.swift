//
//  TagManagerConstants.swift
//  DBZTagManager
//
//  Created by Ahmed Omer on 3/8/18.
//  Copyright © 2018 Dubizzle. All rights reserved.
//

import NCNinja

public struct TagManagerConstants {

  public struct EventNames {
    
    public static let addToFavorites = "addToFavorites"
    public static let addressClicked = "addressClicked"
    public static let alertLogin = "alertLogin"
    public static let back = "back"
    public static let backButton = "backButton"
    public static let browse = "browse"
    public static let browseLpv = "browseLpv"
    public static let callSent = "callSent"
    public static let callButton = "callButton"
    public static let cancel = "cancel"
    public static let categoryBrowser = "categoryBrowser"
    public static let chatBlocked = "chatBlocked"
    public static let chatBuyerMessaged = "chatBuyerMessaged"
    public static let chatInitiatedLoggedIn = "chatInitiatedLoggedIn"
    public static let chatLocationSent = "chatLocationSent"
    public static let chatMessageSent = "chatMessageSent"
    public static let chatroom = "chatroom"
    public static let chatSellerReplied = "chatSellerReplied"
    public static let chatUnblocked = "chatUnblocked"
    public static let chooseLocationAutomatic = "chooseLocationAutomatic"
    public static let citySelector = "citySelector"
    public static let classicResultsView = "classicResultsView"
    public static let clickRecentSearchItem = "clickRecentSearchItem"
    public static let deleteAction = "deleteAction"
    public static let deleteAdCancel = "deleteAdCancel"
    public static let deleteAdConfirm = "deleteAdConfirm"
    public static let deleteFromFavourites = "deleteFromFavourites"
    public static let deleteSavedSearchButton = "deleteSavedSearchButton"
    public static let dislikeApp = "dislikeApp"
    public static let dpv = "dpv"
    public static let DPVChatButtonClicked = "dpvChatButtonClicked"
    public static let editAdAction = "editAdAction"
    public static let editAdPage = "editAdPage"
    public static let emailAlertsSubscriptionClicked = "emailAlertsSubscriptionClicked"
    public static let emailAlertsSubscriptionSuccess = "emailAlertsSubscriptionSuccess"
    public static let emailEntered = "emailEntered"
    public static let emailEnteredRegistration = "emailEnteredRegistration"
    public static let emailLogin = "emailLogin"
    public static let emailLoginSuccess = "emailLoginSuccess"
    public static let emailScreen = "emailScreen"
    public static let emailSent = "emailSent"
    public static let emailButton = "emailButton"
    public static let facebookLoginButtonClicked = "facebookLoginButtonClicked"
    public static let facebookLoginConflict = "facebookLoginConflict"
    public static let facebookLoginError = "facebookLoginError"
    public static let facebookLoginSuccess = "facebookLoginSuccess"
    public static let facebookLoginSuccessNewUserRegistered = "facebookLoginSuccessNewUserRegistered"
    public static let favoriteButton = "favoriteButton"
    public static let favourites = "favourites"
    public static let forgotPasswordEmailSent = "forgotPasswordEmailSent"
    public static let forward = "forward"
    public static let gaveNoRating = "gaveNoRating"
    public static let gaveRating = "gaveRating"
    public static let go = "go"
    public static let homeIcon = "homeIcon"
    public static let homeIconmotors = "homeIconMotors"
    public static let homeIconproperty = "homeIconProperty"
    public static let homeIconclassified = "homeIconClassified"
    public static let homeIconjobs = "homeIconJobs"
    public static let homeIconcommunity = "homeIconCommunity"
    public static let homeScreen = "homeScreen"
    public static let homeTopSearch = "homeTopSearch"
    public static let imageGalleryClicked = "imageGalleryClicked"
    public static let imageResultsView = "imageResultsView"
    public static let jobsApplyAttachCV = "jobsApplyAttachCv"
    public static let jobsApplyAttachCVFailed = "jobsApplyAttachCvFailed"
    public static let jobsApplyDPVClick = "jobsApplyDpvClick"
    public static let jobsApplyFailedValidationExperienceLevel = "jobsApplyFailedValidationExperienceLevel"
    public static let jobsApplySentCongrats = "jobsApplySentCongrats"
    public static let jwEmailSales = "jwEmailSales"
    public static let likeApp = "likeApp"
    public static let listingLoaded = "listingLoaded"
    public static let locationPermissionNo = "locationPermissionNo"
    public static let locationPermissionYes = "locationPermissionYes"
    public static let login = "login"
    public static let loginSubmission = "loginSubmission"
    public static let logoutAction = "logoutAction"
    public static let lpvErrorPage = "lpvErrorPage"
    public static let lpvAddToFavourites = "lpvAddToFavourites"
    public static let lpvDeleteFromFavourites = "lpvRemoveFromFavourites"
    public static let makeAnOfferButtonConfirmClicked = "makeAnOfferButtonConfirmClicked"
    public static let makeAnOfferChatInitiatedLoggedIn = "makeAnOfferChatInitiatedLoggedIn"
    public static let makeAnOfferChatInitiatedLoggedInLowBid = "makeAnOfferChatInitiatedLoggedInLowBid"
    public static let makeAnOfferChatLowBid = "makeAnOfferChatLowBid"
    public static let makeAnOfferChatRetry = "makeAnOfferChatRetry"
    public static let makeAnOfferDPVButtonClicked = "makeAnOfferDpvButtonClicked"
    public static let makeAnOfferScreen = "makeAnOfferScreen"
    public static let mapResultsView = "mapResultsView"
    public static let mapViewToggled = "mapViewToggled"
    public static let messageButtonClicked = "messageButtonClicked"
    public static let moreDetails = "moreDetails"
    public static let myAds = "myAds"
    public static let myAccount = "myAccount"
    public static let myChats = "myChats"
    public static let myNotifications = "myNotifications"
    public static let nameEnteredRegistration = "nameEnteredRegistration"
    public static let paaCongratsUAE = "paaCongrats"
    public static let paaPressed = "paaPressed"
    public static let passwordEntered = "passwordEntered"
    public static let passwordEnteredRegistration = "passwordEnteredRegistration"
    public static let placeAnAd = "placeAnAd"
    public static let profileChangePasswordButtonClicked = "profileChangePasswordButtonClicked"
    public static let profileEmailEditButtonClicked = "profileEmailEditButtonClicked"
    public static let profilePhoneEditButtonClicked = "profilePhoneEditButtonClicked"
    public static let profilePictureChooseNewPictureFromLibraryButtonClicked = "profilePictureChooseNewPictureFromLibraryButtonClicked"
    public static let profilePictureEditButtonClicked = "profilePictureEditButtonClicked"
    public static let profilePictureEditCancelButtonClicked = "profilePictureEditCancelButtonClicked"
    public static let profilePictureTakeNewPictureFromCameraButtonClicked = "profilePictureTakeNewPictureFromCameraButtonClicked"
    public static let profilePictureTakeNewPictureFromCameraUnavailableFailure = "profilePictureTakeNewPictureFromCameraUnavailableFailure"
    public static let profilePictureUploadNewPictureFailure = "profilePictureUploadNewPictureFailure"
    public static let profilePictureUploadNewPictureSuccess = "profilePictureUploadNewPictureSuccess"
    public static let profilePictureViewButtonClicked = "profilePictureViewButtonClicked"
    public static let profilePrivacyCheckBoxClicked = "profilePrivacyCheckBoxClicked"
    public static let profilePrivacySwitchToPrivate = "profilePrivacySwitchToPrivate"
    public static let profilePrivacySwitchToPublic = "profilePrivacySwitchToPublic"
    public static let profileUpdated = "profileUpdated"
    public static let profileViewed = "profileViewed"
    public static let ratingView = "ratingView"
    public static let readMore = "readMore"
    public static let registerSubmission = "registerationSubmission"
    public static let registerSuccess = "registerationSuccess"
    public static let registration = "registration"
    public static let reload = "reload"
    public static let reportAdCopyrightInfringement = "reportAdCopyrightInfringement"
    public static let reportAdFraud = "reportAdFraud"
    public static let reportAdIncorrectPrice = "reportAdIncorrectPrice"
    public static let reportAdMenuButtonClicked = "reportAdMenuButtonClicked"
    public static let reportAdMiscategorized = "reportAdMiscategorized"
    public static let reportAdPropertyNotAvailable = "reportAdPropertyNotAvailable"
    public static let reportAdRepetitiveListing = "reportAdRepetitiveListing"
    public static let reportAdSpam = "reportAdSpam"
    public static let reportAdSpamCommercial = "reportAdSpamCommercial"
    public static let reportAdSpamOffensive = "reportAdSpamOffensive"
    public static let reportAdSpamIrrelevant = "reportAdSpamIrrelevant"
    public static let reportAdSpamOther = "reportAdSpamOther"
    public static let resetPassword = "resetPassword"
    public static let resultsFilterActionNoResult = "resultsFilterActionNoResult"
    public static let resultsSortAction = "resultsSortAction"
    public static let resultsSortActionNoResult = "resultsSortActionNoResult"
    public static let resultsViewAction = "resultsViewAction"
    public static let resultsViewTypeActionNoResult = "resultsViewTypeActionNoResult"
    public static let savedSearches = "savedSearches"
    public static let saveSearch = "saveSearch"
    public static let saveSearchActionNoResult = "saveSearchActionNoResult"
    public static let saveSearchAllowEmail = "saveSearchAllowEmail"
    public static let saveSearchAllowPush = "saveSearchAllowPush"
    public static let saveSearchConfirmed = "saveSearchConfirmed"
    public static let saveSearchDeleteAll = "saveSearchDeleteAll"
    public static let saveSearchDisableEmail = "saveSearchDisableEmail"
    public static let saveSearchDisablePush = "saveSearchDisablePush"
    public static let saveSearchGotIt = "saveSearchGotIt"
    public static let saveSearchImOK = "saveSearchImOK"
    public static let saveSearchUpdateAlerts = "saveSearchUpdateAlerts"
    public static let scheduleAfternoon = "scheduleAfternoon"
    public static let searchCategory = "searchCategory"
    public static let searchFilters = "searchFilters"
    public static let searchLPV = "searchLPV"
    public static let SeeSellerProfile = "SeeSellerProfile"
    public static let sendSuccess = "sendSuccess"
    public static let shareAction = "shareAction"
    public static let showLessAmenities = "showLessAmenities"
    public static let showLessDesc = "showLessDesc"
    public static let showLessDetails = "showLessDetails"
    public static let showMap = "showMap"
    public static let showMoreAmenities = "showMoreAmenities"
    public static let showMoreDesc = "showMoreDesc"
    public static let showMoreDetails = "showMoreDetails"
    public static let showPhoneDescription = "showPhoneDescription"
    public static let similarAdsClick = "similarAdsClick"
    public static let similarAdsVisibleScrollVertically = "similarAdsVisibleScrollVertically"
    public static let smsSent = "smsSent"
    public static let sortDateNewestOldest = "sortDateNewestOldest"
    public static let sortDateOldestNewest = "sortDateOldestNewest"
    public static let sortPriceHighestLowest = "sortPriceHighestLowest"
    public static let sortPriceLowestHighest = "sortPriceLowestHighest"
    public static let streetViewToggled = "streetViewToggled"
    public static let termsConditions = "terms&Conditions"
    public static let updatePromptHomeAction = "updatePromptHomeAction"
    public static let updatePromptMenuAction = "updatePromptMenuAction"
    public static let userMenu = "userMenu"
    public static let ustaDPVBanner = "ustaDPVBanner"
    public static let ustaDetailsPage = "ustaDetailsPage"
    public static let ustaFromField = "ustaFromField"
    public static let ustaToField = "ustaToField"
    public static let ustaWhenField = "ustaWhenField"
    public static let ustaHousetypeField = "ustaHousetypeField"
    public static let ustaBedroomField = "ustaBedroomField"
    public static let ustaNextButton = "ustaNextButton"
    public static let ustaContactPage = "ustaContactPage"
    public static let ustaScheduleField = "ustaScheduleField"
    public static let ustaGetQuotes = "ustaGetQuotes"
    public static let ustaConfirmPhone = "ustaConfirmPhone"
    public static let ustaSuccessPage = "ustaSuccessPage"
    public static let verificationEmailSent = "verificationEmailSent"
    public static let yourAdsDeleteAdCancelationClick = "yourAdsDeleteAdCancelationClick"
    public static let yourAdsDeleteAdConfirmationClick = "yourAdsDeleteAdConfirmationClick"
    public static let yourAdsDeleteAdSelectionClick = "yourAdsDeleteAdSelectionClick"
    public static let yourAdsDeleteAllConfirmationClick = "yourAdsDeleteAllConfirmationClick"
    public static let yourAdsDropdownMenuClick = "yourAdsDropdownMenuClick"
    public static let yourAdsFeatureAdCancelationClick = "yourAdsFeatureAdCancelationClick"
    public static let yourAdsFeatureAdConfirmationClick = "yourAdsFeatureAdConfirmationClick"
    public static let yourAdsFeatureAdSelectionClick = "yourAdsFeatureAdSelectionClick"
    public static let yourAdsFeatureAllConfirmationClick = "yourAdsFeatureAllConfirmationClick"
    public static let yourAdsRefreshAdCancelationClick = "yourAdsRefreshAdCancelationClick"
    public static let yourAdsRefreshAdConfirmationClick = "yourAdsRefreshAdConfirmationClick"
    public static let yourAdsRefreshAdSelectionClick = "yourAdsRefreshAdSelectionClick"
    public static let yourAdsRefreshAllConfirmationClick = "yourAdsRefreshAllConfirmationClick"
    public static let yourAdsUpgradeAdAction = "yourAdsUpgradeAdAction"
    public static let yourAdsUpgradeAdPage = "yourAdsUpgradeAdPage"
    public static let yourAdsUpgradeAdSelectionClick = "yourAdsUpgradeAdSelectionClick"
  }

  public struct AttributeNames {

    public static let adId = "adId"
    public static let categoryId = "categoryId"
    public static let categoryLevel1Id = "categoryLevelOneId" // TODO: use this in the main app
    public static let categoryLevel2Id = "categoryLevelTwoId" // TODO: use this in the main app
    public static let categoryLevel3Id = "categoryLevelThreeId" // TODO: use this in the main app
    public static let categoryLevel4Id = "categoryLevelFourId" // TODO: use this in the main app
    public static let cityId = "cityId"
    public static let imagesCount = "imagesCount"
    public static let resultset = "resultset" // TODO: listing > resultset
    public static let matcherId = "matcher_id"
    public static let messageForm = "replyform"
    public static let pushId = "pushId"
    public static let reply = "replysent"
    public static let resultCount = "resultCount"
    public static let resultSetType = "resultSetType" // TODO: resultSet > resultSetType
    public static let smsResultCode = "smsResultCode"
    public static let tapCall = "tapCall"
    public static let tapSms = "tapSMS"
    public static let userId = "userId"
  }

  public struct EventTypes {

    public static let pageView = "page-view" // TODO: renamed from TRACK_PAGELOAD in the main project
    public static let event = "event" // TODO: renamed from TRACK_EVENT in the main project
  }
}