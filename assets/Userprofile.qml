/* this page is the user profile contains
 * user image 
 * user name
 * user shots
 * user fllowers
 * user following
 */

import bb.cascades 1.2
import bb.system 1.2
import org.labsquare 1.0
import bb.data 1.0


Page {
    id: userpage
    actions: [
        ActionItem {
            title: qsTr("Profile In Browser")
            imageSource: "asset:///images/ic_browser.png"
            onTriggered: {
                Qt.openUrlExternally(playerUrl)
            }
            ActionBar.placement: ActionBarPlacement.InOverflow
        },
        ActionItem {
            title: qsTr("Profile") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                var webpg = webpage.createObject();
                webpg.url = playerUrl;
                nav.push(webpg);
            }
            imageSource: "asset:///images/browes.png"

            attachedObjects: [
                ComponentDefinition {
                    id: webpage
                    source: "ViewWebPage.qml"
                }
            ]
        },
        ActionItem {
            title: qsTr("Follow")
            imageSource: "asset:///images/twitter_logo.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                //twitter profile invocation
                Qt.openUrlExternally("twitter:connect:" + twitterid)
                //   _socialInvocation.invoke("com.twitter.urihandler", "bb.action.VIEW", "", "twitter:connect:facebook" )
                //twitter:connect:
            }

        }
    ]
    // property string userid : ("http://api.dribbble.com/players/" +ListItemData.id+"/shots?per_page=30")
    property alias userSource: userDatasrc.source
    property string twitterid
    property string playerUrl
    property string userid

    Container {
        bottomPadding: 15
        background: Color.White
        Container {
            id: commentslist
            ListView {
                id: userprofile
                property variant nav: nav
                dataModel: ArrayDataModel {
                    id: datamodel
                }
                listItemComponents: [

                    ListItemComponent {

                        Container {

                            id: main
                            Container {
                                preferredWidth: 768
                                minHeight: 500
                                // leftPadding: 150
                                background: Color.create("#ea4c89")
                                verticalAlignment: VerticalAlignment.Top
                                horizontalAlignment: HorizontalAlignment.Left
                                layoutProperties: FlowListLayoutProperties {

                                }
                                layout: StackLayout {
                                    orientation: LayoutOrientation.TopToBottom

                                }

                                
                                Label {
                                    text: ListItemData.username
                                    textStyle.color: Color.White
                                    textStyle.fontSize: FontSize.XXLarge
                                    textStyle.fontWeight: FontWeight.Bold
                                    verticalAlignment: VerticalAlignment.Center
                                    horizontalAlignment: HorizontalAlignment.Center
                                }
                                WebImageView {
                                    id: playerAvatar
                                    url: ListItemData.avatar_url
                                    preferredHeight: 250
                                    preferredWidth: 250
                                    verticalAlignment: VerticalAlignment.Center
                                    horizontalAlignment: HorizontalAlignment.Center
                                    scalingMethod: ScalingMethod.Fill
                                }

                                Container {

                                    id: linksInfo
                                    layoutProperties: StackLayoutProperties {

                                    }
                                    layout: StackLayout {
                                        orientation: LayoutOrientation.LeftToRight
                                    }
                                    background: Color.Transparent
                                    verticalAlignment: VerticalAlignment.Center
                                    horizontalAlignment: HorizontalAlignment.Center
                                    Container {

                                        id: shotsBox

                                        layoutProperties: StackLayoutProperties {
                                        }
                                        layout: StackLayout {
                                            orientation: LayoutOrientation.TopToBottom
                                        }
                                        background: Color.Transparent
                                        Label {
                                            id: shotCount
                                            text: ListItemData.shots_count
                                            textStyle.textAlign: TextAlign.Center
                                            textStyle.color: Color.White
                                            textStyle.fontFamily: "Slate Pro"
                                            textStyle.fontSize: FontSize.XLarge
                                            verticalAlignment: VerticalAlignment.Top
                                            horizontalAlignment: HorizontalAlignment.Center
                                            textStyle.fontWeight: FontWeight.Bold

                                        }
                                        Label {
                                            text: "SHOTS" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.color: Color.White
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontWeight: FontWeight.W100
                                            verticalAlignment: VerticalAlignment.Bottom
                                            horizontalAlignment: HorizontalAlignment.Center
                                            textStyle.fontFamily: "DejaVu Sans"

                                        }
                                        gestureHandlers: TapHandler {
                                            onTapped: {
                                                usershotsSheet.creationCompleted()
                                                usershotsSheet.open()
                                              //  var shotspg = shotspage.createObject();
                                               // shotspg.playerid = ListItemData.id;
                                               // main.ListItem.view.nav.push(shotspg);

                                            }
                                        }
                                        attachedObjects: [
                                            Usershots {
                                                id: usershotsSheet
                                                playid:ListItemData.username
                                            }
                                        ]
                                    }
                                    Container {
                                        leftPadding: 35
                                        id: followerBox

                                        layoutProperties: StackLayoutProperties {
                                        }
                                        layout: StackLayout {
                                            orientation: LayoutOrientation.TopToBottom
                                        }

                                        background: Color.Transparent
                                        horizontalAlignment: HorizontalAlignment.Center
                                        Label {

                                            text: ListItemData.followers_count
                                            textStyle.color: Color.White
                                            textStyle.fontFamily: "Slate Pro"
                                            textStyle.fontSize: FontSize.XLarge
                                            verticalAlignment: VerticalAlignment.Top
                                            horizontalAlignment: HorizontalAlignment.Center
                                            textStyle.fontWeight: FontWeight.Bold
                                        }
                                        Label {
                                            text: "FOLLOWERS" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.color: Color.White
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontWeight: FontWeight.W100
                                            verticalAlignment: VerticalAlignment.Bottom
                                            horizontalAlignment: HorizontalAlignment.Center
                                            textStyle.fontFamily: "DejaVu Sans"
                                        }
                                        gestureHandlers: TapHandler {
                                            onTapped: {
                                                followersSheet.creationCompleted()
                                                followersSheet.open()
                                                //  var shotspg = shotspage.createObject();
                                                // shotspg.playerid = ListItemData.id;
                                                // main.ListItem.view.nav.push(shotspg);
                                                                                        }
                                        }
                                        attachedObjects: [
                                            Followers {
                                             //   id: followersSheet
                                                id:followersSheet
                                                playid:ListItemData.username
                                                
                                            }
                                        ]

                                    }
                                    Container {
                                        leftPadding: 35
                                        id: followingBox
                                        layout: StackLayout {

                                        }
                                        layoutProperties: StackLayoutProperties {

                                        }
                                        background: Color.Transparent
                                        horizontalAlignment: HorizontalAlignment.Right
                                        Label {

                                            text: ListItemData.following_count
                                            textStyle.color: Color.White
                                            textStyle.fontFamily: "Slate Pro"
                                            textStyle.fontSize: FontSize.XLarge
                                            verticalAlignment: VerticalAlignment.Top
                                            horizontalAlignment: HorizontalAlignment.Center
                                            textStyle.fontWeight: FontWeight.Bold
                                        }

                                        Label {

                                            text: "FOLLOWING" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.color: Color.White
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontWeight: FontWeight.W100
                                            verticalAlignment: VerticalAlignment.Bottom
                                            horizontalAlignment: HorizontalAlignment.Center
                                            textStyle.fontFamily: "DejaVu Sans"
                                        }
                                        gestureHandlers: TapHandler {
                                            onTapped: {
                                                followingSheet.creationCompleted()
                                                followingSheet.open()
                                                //  var shotspg = shotspage.createObject();
                                                // shotspg.playerid = ListItemData.id;
                                                // main.ListItem.view.nav.push(shotspg);
                                            
                                            }
                                        }
                                        attachedObjects: [
                                            Following {
                                                id: followingSheet
                                                playid:ListItemData.username
                                            }
                                        ]
                                    }

                                }

                            }

                            layoutProperties: StackLayoutProperties {
                            }
                            layout: StackLayout {
                                orientation: LayoutOrientation.TopToBottom
                            }
                            verticalAlignment: VerticalAlignment.Top
                            background: Color.Transparent

                            Container {

                                id: playerinfo

                                layoutProperties: StackLayoutProperties {

                                }
                                layout: StackLayout {
                                    orientation: LayoutOrientation.LeftToRight
                                }
                                verticalAlignment: VerticalAlignment.Top
                                horizontalAlignment: HorizontalAlignment.Left

                                Container {

                                    maxWidth: 768
                                    layoutProperties: FlowListLayoutProperties {

                                    }
                                    layout: StackLayout {
                                        orientation: LayoutOrientation.LeftToRight
                                    }
                                    Container {
                                        id: itemlables
                                        topPadding: 10
                                        leftPadding: 10
                                        maxWidth: 400

                                        layoutProperties: StackLayoutProperties {
                                        }
                                        layout: StackLayout {
                                            orientation: LayoutOrientation.TopToBottom
                                        }
                                        verticalAlignment: VerticalAlignment.Top
                                        horizontalAlignment: HorizontalAlignment.Left
                                        Label {
                                            text: "Name:" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.fontWeight: FontWeight.W400
                                            textStyle.color: Color.Black
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }

                                        Label {
                                            text: "Location:" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.fontWeight: FontWeight.W400
                                            textStyle.color: Color.Black
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }

                                        Label {
                                            text: "Likes:" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.fontWeight: FontWeight.W400
                                            textStyle.color: Color.Black
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: "Likes Received:" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.fontWeight: FontWeight.W400
                                            textStyle.color: Color.Black
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: "Comments:" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.fontWeight: FontWeight.W400
                                            textStyle.color: Color.Black
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: "Comments Received:" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.fontWeight: FontWeight.W400
                                            textStyle.color: Color.Black
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: "Rebounds:" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.fontWeight: FontWeight.W400
                                            textStyle.color: Color.Black
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: "Rebounds Received:" + Retranslate.onLocaleOrLanguageChanged
                                            textStyle.fontWeight: FontWeight.W400
                                            textStyle.color: Color.Black
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }

                                    }
                                    Container {
                                        id: itemcontent
                                        topPadding: 10

                                        background: Color.White
                                        layoutProperties: StackLayoutProperties {

                                        }
                                        layout: StackLayout {
                                            orientation: LayoutOrientation.TopToBottom

                                        }
                                        verticalAlignment: VerticalAlignment.Top
                                        horizontalAlignment: HorizontalAlignment.Right
                                        Label {
                                            text: (ListItemData.name)
                                            textStyle.fontWeight: FontWeight.Bold
                                            textStyle.color: Color.create("#ea4c89")
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: (ListItemData.location)
                                            textStyle.fontWeight: FontWeight.Bold
                                            textStyle.color: Color.create("#ea4c89")
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }

                                        Label {
                                            text: (ListItemData.likes_count)
                                            textStyle.fontWeight: FontWeight.Bold
                                            textStyle.color: Color.create("#ea4c89")
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: (ListItemData.likes_received_count)
                                            textStyle.fontWeight: FontWeight.Bold
                                            textStyle.color: Color.create("#ea4c89")
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }

                                        Label {
                                            text: (ListItemData.comments_count)
                                            textStyle.fontWeight: FontWeight.Bold
                                            textStyle.color: Color.create("#ea4c89")
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: (ListItemData.comments_received_count)
                                            textStyle.fontWeight: FontWeight.Bold
                                            textStyle.color: Color.create("#ea4c89")
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: (ListItemData.rebounds_count)
                                            textStyle.fontWeight: FontWeight.Bold
                                            textStyle.color: Color.create("#ea4c89")
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }
                                        Label {
                                            text: (ListItemData.rebounds_received_count)
                                            textStyle.fontWeight: FontWeight.Bold
                                            textStyle.color: Color.create("#ea4c89")
                                            textStyle.fontSize: FontSize.Medium
                                            textStyle.fontFamily: "Slate Pro"
                                            multiline: true
                                        }

                                    }

                                }

                            }
                        }

                    }
                ]
                scrollIndicatorMode: ScrollIndicatorMode.ProportionalBar
                snapMode: SnapMode.Default
                layout: FlowListLayout {
                }
            }
            attachedObjects: [
                DataSource {
                    id: userDatasrc
                    type: DataSourceType.Json
                    remote: true
                    onDataLoaded: {
                        userprofile.dataModel.append(data)

                    }
                    onSourceChanged: {
                        userDatasrc.load()
                        
                    }
                }
            ]
            
        }

    }
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.Default
    resizeBehavior: PageResizeBehavior.None
    actionBarVisibility: ChromeVisibility.Visible
    } 
