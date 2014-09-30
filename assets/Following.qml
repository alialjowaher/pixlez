import bb.cascades 1.2
import bb.system 1.2
import org.labsquare 1.0
import bb.data 1.0
Sheet {
    
    id:followingSheet
    property string  playid  
    property string userDS :("http://api.dribbble.com/players/"+ playid +"/following?per_page=30")
        NavigationPane {
        id: navepane    
        
        Page {
           
            id:userfollowerspage
           
                    Container {
                        layout: StackLayout {
                        }
                        Container {
                    layoutProperties: StackLayoutProperties {
                            
                    }
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight

                    }
                    leftPadding: 50
                    Label {
                        text: "FOLLOWING" + Retranslate.onLocaleOrLanguageChanged
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.color: Color.create("#ea4c89")
                        textStyle.fontSize: FontSize.Large
                        textStyle.fontFamily: "DejaVu Sans"
                        leftMargin: 250.0
                    }
                    preferredHeight: 110
                    
                }
               Container {
                Container {
                    ListView {
                        scrollRole: ScrollRole.Main
                        id: shotslistview
                        dataModel: ArrayDataModel {
                            id: datamodel
                        }
                        listItemComponents: [
                            ListItemComponent {
                            Container {
                                        layoutProperties: StackLayoutProperties {
                                        
                                        }
                                        bottomPadding: 10
                                        layout: StackLayout {
                                            orientation: LayoutOrientation.LeftToRight

                                        }
                                        WebImageView {
                                    url: ListItemData.avatar_url
                                    preferredHeight: 140
                                    preferredWidth: 140
                                }
                                Label {
                                    text: ListItemData.name
                                    textStyle.fontSize: FontSize.Large
                                    textStyle.fontWeight: FontWeight.Bold
                                    textStyle.fontFamily: "Slate Pro"
                                            verticalAlignment: VerticalAlignment.Center
                                }
                                
                           }
                            
                       } 
                          ]
                          onTriggered: {
                              var selected = datamodel.data(indexPath)
                              console.log(selected.username)
                              var folpage = followerpg.createObject()
                              
                              folpage.userSource = ("http://api.dribbble.com/" + selected.id)
                              //userpg.twitterid = ListItemData.twitter_screen_name
                             // players/
                              if (selected.twitter_screen_name == null) {
                                  folpage.twitterid = selected.username
                              } else {
                                  folpage.twitterid = selected.twitter_screen_name
                              }
                              if(selected.url == null){
                                  folpage.playerUrl = 0
                              }
                              else {
                                  folpage.playerUrl = selected.url
                              }
                              
                           //   folpage.playerUrl = selected.url
                              folpage.userid = selected.id
                              navepane.push(folpage)    
                          }
                          
                         
                        attachedObjects: [
                            ComponentDefinition {
                                id: followerpg
                                source: "Userprofile.qml"
                            },
                            ListScrollStateHandler {
                                id: scrollend
                                property int pagenumber: 1
                                onAtEndChanged: {
                                    if (atEnd) {
                                        var newpage = pagenumber ++
                                        var newsource = followingsource.source + ";page=" + newpage
                                        followingsource.setSource(newsource)
                                        followingsource.sourceChanged(newsource)
                                    }
                                }
                            }
                        ]
                        layout: FlowListLayout {

                            }
                            layoutProperties: FlowListLayoutProperties {

                            }

                        }
                    attachedObjects: [
                        DataSource {
                            id: followingsource
                            source: userDS
                            remote: true
                            onDataLoaded: {
                                shotslistview.dataModel.append(data.players)
                            }
                            onSourceChanged: {
                                followingsource.load()
                            }
                            type: DataSourceType.Json
                        }
                    ]
                    
                    onCreationCompleted: {
                 //   followerSource.load()
                      //  console.log(followerSource.source)
                    }
                        layoutProperties: FlowListLayoutProperties {

                        }
                        layout: StackLayout {

                        }

                    }
            
        
}
        }
                
            actions: [
                ActionItem {
                    title: "Back"
                    
                    onTriggered: {
                        followingSheet.close()
                    }
                    imageSource: "asset:///images/ic_previous.png"
                    ActionBar.placement: ActionBarPlacement.OnBar
                }
                 
            ]
            actionBarVisibility: ChromeVisibility.Visible
            actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
            paneProperties: NavigationPaneProperties {
                backButton: ActionItem {
                    title: "Back"
                //   ActionBar.placement: ActionBarPlacement.OnBar
                    onTriggered: {
                        followingSheet.close()
            }

                }

            }

        }
        onCreationCompleted: {
          //  followerSource.load()
        }
       
        
        
}
    
    onOpened: {
        followingsource.load()
    }    
    } 
  

 