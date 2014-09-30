import bb.cascades 1.2
import bb.system 1.2
import org.labsquare 1.0
import bb.data 1.0
Page {
    //   property alias shotid : commentid.text
    property alias commentSource : commentDatasrc.source
    id: compage
    Container {
        background: Color.White
        Container {
            preferredWidth: 768
            preferredHeight: 110
            leftPadding: 30
            background: Color.create("#ea4c89")
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            layoutProperties: StackLayoutProperties {
            
            }
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            
            }
            
            Label {
                text: "COMMENTS"
                textStyle.color: Color.White
                textStyle.fontSize: FontSize.Large
                textStyle.fontWeight: FontWeight.Bold
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
            }
        
        }
        Container {
            id:commentslist
            
            ListView {
                id:commentList
                dataModel: ArrayDataModel {
                    id:datamodel
                } 
                listItemComponents: [ 
                    ListItemComponent {
                        Container {
                            layoutProperties: StackLayoutProperties {
                            }
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            verticalAlignment: VerticalAlignment.Top
                            //bottomMargin: 10.0
                            leftMargin: 0.0
                            rightPadding: 10
                            leftPadding: 10
                            bottomPadding: 20
                            background: Color.Transparent
                            WebImageView {
                                id: playerAvatar
                                url: ListItemData.player.avatar_url
                                preferredHeight: 140
                                preferredWidth: 140
                                maxHeight: 140 
                                maxWidth: 140
                                verticalAlignment: VerticalAlignment.Top
                            
                            }
                            Container {
                                id: pNameComment
                                maxWidth:600
                                //  minWidth: 630
                                
                                // clipContentToBounds: true
                                background: Color.Transparent
                                
                                layoutProperties: StackLayoutProperties {
                                
                                }
                                layout: StackLayout {
                                
                                }
                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Center
                                Label {
                                    id: playerUsername
                                    text: ListItemData.player.username
                                    textStyle.fontWeight: FontWeight.Bold
                                    textStyle.fontSize: FontSize.Large
                                    textStyle.fontStyle: FontStyle.Default
                                    textStyle.color: Color.create("#444444")
                                    textStyle.textAlign: TextAlign.Left
                                    
                                    textFit.maxFontSizeValue: 7.0
                                    //  textStyle.textAlign: TextAlign.Center
                                
                                }
                                TextArea {
                                    id:comnt
                                    text: ListItemData.body
                                    verticalAlignment: VerticalAlignment.Top
                                    textStyle.fontWeight: FontWeight.W200
                                    textStyle.fontSize: FontSize.Small
                                    textStyle.textAlign: TextAlign.Left
                                    textStyle.color: Color.Black
                                    textStyle.fontFamily: "DejaVu Sans"
                                    editable: false
                                    focusHighlightEnabled: true
                                    textFormat: TextFormat.Html
                                    input.submitKey: SubmitKey.None
                                
                                }
                            }
                        }
                    }
                     
                ] 
                onTriggered: {
                    var selecteditem = datamodel.data(indexPath)
                 //   console.log(selected.username)
                    var folpage = followerpg.createObject()
                    
                    folpage.userSource = ("http://api.dribbble.com/" + selecteditem.player.id)
                    //userpg.twitterid = ListItemData.twitter_screen_name
                    // players/
                    if (selecteditem.player.twitter_screen_name == null) {
                        folpage.twitterid = selecteditem.player.username
                        
                    } else {
                        folpage.twitterid = selecteditem.player.twitter_screen_name
                    }
                    if(selecteditem.url == null){
                        folpage.playerUrl = 0
                    }
                    else {
                        folpage.playerUrl = selecteditem.player.url
                    }
                    
                    //   folpage.playerUrl = selected.url
                    folpage.userid = selecteditem.player.id
                   nav.push(folpage)   
                  //  navigationPane.push(folpage) 
                  //  navepane.push(folpage)
                }
                
                
                attachedObjects: [
                    ComponentDefinition {
                        id: followerpg
                        source: "Userprofile.qml"
                    }
                ]    
                 
                scrollIndicatorMode: ScrollIndicatorMode.ProportionalBar
                snapMode: SnapMode.Default
                layout: FlowListLayout {
                }
            } attachedObjects:[
                
                DataSource {
                    
                    id: commentDatasrc
                    type: DataSourceType.Json
                    remote: true
                    
                    onDataLoaded: {
                        commentList.dataModel.append(data.comments)
                    }
                    onSourceChanged: {
                        commentDatasrc.load()
                    }
                } ]
            
            background: Color.Transparent
        
        } 
    
    
    } 
    paneProperties: NavigationPaneProperties {
        
        backButton: ActionItem {
            title: "Back"
            //   imageSource: "asset:///back.png"
            onTriggered: {
                nav.pop();
                navepane.pop()
            
            }
        
        }
         
    } 
   // actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    actionBarVisibility: ChromeVisibility.Hidden
    resizeBehavior: PageResizeBehavior.Resize

}



