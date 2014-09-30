/*this app was developed by Ali Aljowaher [AZ labs] 
 * for details email me ali.aljowaher@gmail.com
 * all right reserved 
 */
import bb.cascades 1.2
import bb.system 1.2
import org.labsquare 1.0
import bb.data 1.0




Page {
    id:shotpage
    actions: [
       
        ActionItem {
            title: "View" + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
            
            imageSource: "asset:///images/browes.png"
            onTriggered: {
                Qt.openUrlExternally(itemurl.text)
            }
            
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
                shareit.uri = itemurl.text + " #Pixlez #BlackBerry 10"
                shareit.updateQuery()
            }
            imageSource: "asset:///images/ic_share.png"
        }
        
    ]
    //passed values from the catgory page (popular,everyone,debuts)
    property alias thetitle : shottitle.text;
    property alias theimage : fullimage.url;
    property alias likes : likescount.text ;
    property alias views : viewcount.text;
    property alias user_image : player_img.url;
    property alias commentsCount:commentscount.text;
    property alias userName : username.text;
    property alias urlLink : itemurl.text;
    property alias shot_id: shotid.text
    property alias player_id: playerid.text
    property alias twitrUser : twitterid.text
    property alias userUrl : userProfileUrl.text
    
    ScrollView {
        scrollViewProperties.scrollMode: ScrollMode.Vertical
        scrollViewProperties.pinchToZoomEnabled: false
        scrollViewProperties.initialScalingMethod: ScalingMethod.Fill
        scrollViewProperties.overScrollEffectMode: OverScrollEffectMode.Default
        
        Container {
            Label {
                id:userProfileUrl
                visible: false
            }
            Label {
                id:twitterid
                visible: false
            }
            Label {
                id:shotid
                visible: false
            }
            Label {
                id:playerid
                visible: false
            }
            
            background: Color.White

            WebImageView {
                id:fullimage
               // preferredWidth: 768.0
                //preferredHeight:768.0
                
                attachedObjects: [ImageAnimator { // for GIF's to work
                    animatedImage: fullimage.image
                    started: true
                
                },Sheet {
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
                                   
                                    //preferredHeight: 600
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
            
                
                
                horizontalAlignment: HorizontalAlignment.Fill
                scalingMethod: ScalingMethod.AspectFill
                minHeight: 550

            } 
            
            Container {
                
                layoutProperties: FlowListLayoutProperties {
                }
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                background: Color.White
                leftPadding: 20.0
                WebImageView {
                    preferredHeight:  160
                    preferredWidth: 160
                    id: player_img
                    rightMargin: 20.0
                
                }gestureHandlers: TapHandler {
                    onTapped: {
                        var userpg = userpage.createObject()
                        
                        userpg.userSource = ("http://api.dribbble.com/players/"+playerid.text)
                        userpg.twitterid = twitterid.text
                        userpg.playerUrl = userProfileUrl.text 
                        navigationPane.push(userpg)
                    }
                } 
                attachedObjects:[ ComponentDefinition {
                        id:userpage
                        source: "Userprofile.qml"
                }  ]
            
            Container {
                id:player_info
                layout: StackLayout {}
                    background: Color.Transparent
                    Label {
                    minWidth: 540
                    maxWidth: 540
                    id:shottitle
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
                    layoutProperties: FlowListLayoutProperties {}
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
                        id:username
                        textStyle.fontSize: FontSize.Medium
                        layoutProperties: FlowListLayoutProperties {}
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.fontStyle: FontStyle.Italic
                    }
                }
            }
            TextArea {
                id:itemurl
                textFormat: TextFormat.Html
                visible: false
            }
            }
            
            Container {
                id:shot_info
                preferredWidth: 768
                preferredHeight:180
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                layoutProperties: StackLayoutProperties {}
                horizontalAlignment: HorizontalAlignment.Center
                leftPadding: 30.0
                Container {
                    id:likes_box
                    layoutProperties: FlowListLayoutProperties {}
                    layout: StackLayout {
                        orientation: LayoutOrientation.TopToBottom
                    }
                    rightMargin: 50.0
                    leftMargin: 20
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
                        id:comnt
                        text: "COMMENTS" + Retranslate.onLocaleOrLanguageChanged
                        textStyle.color: Color.create("#ea4c89")
                        textStyle.fontSize: FontSize.Large
                        textStyle.fontWeight: FontWeight.W100
                        verticalAlignment: VerticalAlignment.Bottom
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.fontFamily: "DejaVu Sans"
                    }
                } gestureHandlers: TapHandler {
                    onTapped: {
                        
                        var cmntpg = commentpage.createObject()
                        cmntpg.commentSource = ("http://api.dribbble.com/shots/" +shotid.text +"/comments?per_page=30")
                        
                        navigationPane.push(cmntpg)
                    }
                } 
                attachedObjects: ComponentDefinition {
                    id:commentpage
                    source: "Comments.qml"
                }
                background: Color.Transparent
            } 
        }
    }
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Back"
            //   imageSource: "asset:///back.png"
            onTriggered: {
                
                navigationPane.pop();
            }
        }
    }
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    resizeBehavior: PageResizeBehavior.None
    actionBarVisibility: ChromeVisibility.Default

}


