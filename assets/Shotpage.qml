/*this app was developed by Ali Aljowaher [AZ labs]
 * for details email me ali.aljowaher@gmail.com
 * all right reserved 
 */
import bb.cascades 1.2
import bb.system 1.2
import org.labsquare 1.0
import bb.data 1.0
Page {
    id: shotpage
    actions: [
      /*  ActionItem {
            title: "View In Browser" + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.InOverflow
            imageSource: "asset:///images/ic_browser.png"
            onTriggered: {
                Qt.openUrlExternally(urlLink)
            }
        },*/
        ActionItem {
            title: "View" + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
            /*onTriggered: {
                var webpg = webpage.createObject();
                webpg.url = urlLink;
                nav.push(webpg);
            } */
            onTriggered: {
                Qt.openUrlExternally(urlLink)
            }
            imageSource: "asset:///images/browes.png"

          /*  attachedObjects: [
                ComponentDefinition {
                    id: webpage
                    source: "ViewWebPage.qml"
                }
            ] */
        },
        ActionItem {
            title:  "Share" + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
            attachedObjects: [
                Invocation {
                    id: invoceshare
                    query: InvokeQuery {
                        id: shareit
                    
                    }onArmed: {
                        trigger("bb.action.SHARE")
                    }
                }
            ]
            onTriggered: {
                shareit.uri = urlLink + " #Pixlez #BlackBerry 10"
                shareit.updateQuery()
            }
            imageSource: "asset:///images/ic_share.png"
        }
       
    ]

		
    
    //passed values from the catgory page (popular,everyone,debuts)
    property alias thetitle: shottitle.text
    property alias theimage: fullimage.url
    property alias likes: likescount.text
    property alias views: viewcount.text
    property alias user_image: player_img.url
    property alias commentsCount: commentscount.text
    property alias userName: username.text
    property string urlLink
    property string shot_id
    property string player_id
    property string twitrUser
    property string userUrl
    property alias descript :descrpttext.text
    
    ScrollView {
        //scrollViewProperties.scrollMode: ScrollMode.Vertical
        scrollViewProperties.pinchToZoomEnabled: false
        scrollViewProperties.initialScalingMethod: ScalingMethod.Fill
        //scrollViewProperties.overScrollEffectMode: OverScrollEffectMode.Default

        Container {

            background: Color.White

            WebImageView {
                id: fullimage
                horizontalAlignment: HorizontalAlignment.Fill
                scalingMethod: ScalingMethod.AspectFill
                minHeight: 550
                // still tring to figure out how to get it to have the same aspect without croping anything out
                attachedObjects: [
                    ImageAnimator { // for GIF's to work
                        animatedImage: fullimage.image
                        started: true
                    },
                    //to display picture in full screen
                    Sheet {
                        id:photosh
                        content: Page {
                            Container {
                                
                                WebImageView {
                                    image: fullimage.image
                                    preferredHeight: 800
                                    verticalAlignment: VerticalAlignment.Center
                                    horizontalAlignment: HorizontalAlignment.Center
                                     preferredWidth: maxWidth
                                }attachedObjects: ImageAnimator { // for GIF's to work
                                    animatedImage: fullimage.image
                                    started: true
                                }
                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Center
                                Button {
                                    text: qsTr("Close")
                                    onClicked: photosh.close()
                                    verticalAlignment: VerticalAlignment.Center
                                    horizontalAlignment: HorizontalAlignment.Center
                                    preferredWidth: 600
                                  //  preferredHeight: 600
                                }
                            }
                        }
                    }
                ]
                gestureHandlers: TapHandler {
                    onTapped: {
                        photosh.open();
                    }
                }
            } 
            
           
            
            //description container 
            
            
            
            Container {
                
                
                layoutProperties: FlowListLayoutProperties {
                }
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                background: Color.White
                leftPadding: 20.0
                WebImageView {
                    preferredHeight: 160
                    preferredWidth: 160
                    id: player_img
                    rightMargin: 20.0

                }
                gestureHandlers: TapHandler {
                    onTapped: {
                        //go to the artist profile
                        var userpg = userpage.createObject()
                        userpg.userSource = ("http://api.dribbble.com/players/" + player_id)
                        
                        userpg.twitterid = twitrUser
                        userpg.playerUrl = userUrl
                        nav.push(userpg)
                    }
                }
                attachedObjects: [
                    ComponentDefinition {
                        id: userpage
                        source: "Userprofile.qml"
                    }
                ]

                Container {
                    id: player_info
                    layout: StackLayout {
                    }
                    Label {
                        id: shottitle
                        minWidth: 540
                        maxWidth: 540
                        textStyle.color: Color.Black
                        textStyle.fontFamily: "Slate Pro"
                        textStyle.fontSize: FontSize.Large
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.textAlign: TextAlign.Justify
                        multiline: true
                        horizontalAlignment: HorizontalAlignment.Left
                        textFormat: TextFormat.Auto
                    }
                    Container {
                        layoutProperties: FlowListLayoutProperties {
                        }
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        background: Color.Transparent
                        Label {
                            text: "by:"
                            textStyle.color: Color.create("#555555")
                            textStyle.fontSize: FontSize.Medium
                        } 
                        Label {
                            id: username
                            
                            textStyle.fontSize: FontSize.Medium
                            textStyle.fontWeight: FontWeight.Bold
                            textStyle.fontStyle: FontStyle.Italic
                            textStyle.color: Color.Black
                        }
                    }
                }
            }

            Container {
                id: shot_info
                preferredWidth: 768
                preferredHeight: 180
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                layoutProperties: StackLayoutProperties {
                }
                horizontalAlignment: HorizontalAlignment.Center
                leftPadding: 30.0
                Container {
                    id: likes_box
                    layoutProperties: FlowListLayoutProperties {
                    }
                    layout: StackLayout {
                        orientation: LayoutOrientation.TopToBottom
                    }
                    rightMargin: 50.0
                    leftMargin: 20
                    background: Color.Transparent
                    Label {
                        id: likescount
                        text: ""
                        textStyle.textAlign: TextAlign.Center
                        textStyle.color: Color.Black
                        textStyle.fontFamily: "Slate Pro"
                        verticalAlignment: VerticalAlignment.Top
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.fontSize: FontSize.XLarge
                    }
                    Label {
                        text: "LIKES" + Retranslate.onLocaleOrLanguageChanged
                        textStyle.color: Color.create("#ea4c89")
                        textStyle.fontSize: FontSize.Large
                        textStyle.fontWeight: FontWeight.W100
                        verticalAlignment: VerticalAlignment.Bottom
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.fontFamily: "DejaVu Sans"
                    }
                }
                Container {
                    id: views_box
                    layoutProperties: FlowListLayoutProperties {
                    }
                    layout: StackLayout {
                        orientation: LayoutOrientation.TopToBottom
                    }
                    rightMargin: 50.0
                    background: Color.Transparent
                    Label {
                        id: viewcount
                        text: ""
                        textStyle.color: Color.Black
                        textStyle.fontFamily: "Slate Pro"
                        verticalAlignment: VerticalAlignment.Top
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.fontSize: FontSize.XLarge
                    }
                    Label {
                        text: "VIEWS" + Retranslate.onLocaleOrLanguageChanged
                        textStyle.color: Color.create("#ea4c89")
                        textStyle.fontSize: FontSize.Large
                        textStyle.fontWeight: FontWeight.W100
                        verticalAlignment: VerticalAlignment.Bottom
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.fontFamily: "DejaVu Sans"
                    }
                }
                Container {
                    id: comments_box
                    layoutProperties: FlowListLayoutProperties {
                    }
                    layout: StackLayout {
                        orientation: LayoutOrientation.TopToBottom
                    }
                    rightMargin: 20.0
                    background: Color.Transparent
                    Label {
                        id: commentscount
                        text: ""
                        textStyle.color: Color.Black
                        textStyle.fontFamily: "Slate Pro"
                        verticalAlignment: VerticalAlignment.Top
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.fontSize: FontSize.XLarge
                    }
                    Label {
                        id: comnt
                        text: "COMMENTS" + Retranslate.onLocaleOrLanguageChanged
                        textStyle.color: Color.create("#ea4c89")
                        textStyle.fontSize: FontSize.Large
                        textStyle.fontWeight: FontWeight.W100
                        verticalAlignment: VerticalAlignment.Bottom
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.fontFamily: "DejaVu Sans"

                        gestureHandlers: TapHandler {
                            onTapped: {
                                var cmntpg = commentpage.createObject()
                                cmntpg.commentSource = ("http://api.dribbble.com/shots/" + shot_id + "/comments?per_page=30")
                                nav.push(cmntpg)
                            }
                        }
                    }
                }
                attachedObjects: ComponentDefinition {
                    id: commentpage
                    source: "Comments.qml"
                }
                background: Color.Transparent
            }
            Container {
                leftPadding: 20.0
                TextArea {
                    
                    id:descrpttext
                    
                    textStyle.fontSize: FontSize.Medium
                    textStyle.fontWeight: FontWeight.Bold
                    textStyle.textAlign: TextAlign.Left
                    textStyle.color: Color.create("#ea4c89")
                    textFormat: TextFormat.Html
                    editable: false
                    maximumLength: 1000
                }
            }
        }
        
        
    }
    // this is the default setting so you dont need to put it in unless you want to add or change info
//    paneProperties: NavigationPaneProperties {
//        backButton: ActionItem {
//            title: "Back"
//            //   imageSource: "asset:///back.png"
//            onTriggered: {
//                nav.pop();
//            }
//        }
//    }
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
//    resizeBehavior: PageResizeBehavior.None
//    actionBarVisibility: ChromeVisibility.Default

}
