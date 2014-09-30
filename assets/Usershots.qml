import bb.cascades 1.2
import bb.system 1.2
import org.labsquare 1.0
import bb.data 1.0
Sheet { 
    
    id:usershotsSheet
    property string  playid  
    property string userDS :("http://api.dribbble.com/players/"+ playid +"/shots?per_page=30")
    NavigationPane {
        id: navigationPane
        
        Page {
           
            id:usershotspage
           
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
                        text: "SHOTS" + Retranslate.onLocaleOrLanguageChanged
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.color: Color.create("#ea4c89")
                        textStyle.fontSize: FontSize.Large
                        textStyle.fontFamily: "DejaVu Sans"
                        leftMargin: 250.0
                    }
                    preferredHeight: 110
                    
                }
                
                     //   bottomPadding: 7.0
                  //      layoutProperties: StackLayoutProperties {
                    //    }
                    //    verticalAlignment: VerticalAlignment.Center
                    //    horizontalAlignment: HorizontalAlignment.Center
                        
                    
            
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
                                
                                WebImageView {
                                    url: ListItemData.image_teaser_url
                                     scalingMethod: ScalingMethod.AspectFill
                                }
                            }
                        
                        ]
                        onTriggered: {
                            var myitem = datamodel.data(indexPath);
                              var shotpage = newShotpage.createObject()
                              shotpage.thetitle = myitem.title;
                              shotpage.theimage = myitem.image_url;
                              shotpage.likes = myitem.likes_count;
                              shotpage.views = myitem.views_count;
                              shotpage.user_image = myitem.player.avatar_url;
                              shotpage.commentsCount = myitem.comments_count;
                              shotpage.userName = myitem.player.username;
                              shotpage.urlLink = myitem.short_url;
                              shotpage.shot_id = myitem.id
                              shotpage.player_id = myitem.player.id
                              //shotpage.twitrUser = myitem.player.twitter_screen_name
                              if (myitem.player.twitter_screen_name == null) {
                                  shotpage.twitrUser = myitem.player.username
                              
                              } else {
                                  shotpage.twitrUser = myitem.player.twitter_screen_name
                              }
                              shotpage.userUrl = myitem.player.url
                              navigationPane.push(shotpage)
                             
                             
                        }
                        attachedObjects: [
                            ComponentDefinition {
                                id: newShotpage
                                source: "NewShot.qml"
                            },
                            ListScrollStateHandler {
                                id: scrollend
                                property int pagenumber: 1
                                onAtEndChanged: {
                                    if (atEnd) {
                                        if ( ListItemData.shots_count > 30){
                                        var newpage = pagenumber ++
                                        var newsource = userSource.source + ";page=" + newpage
                                        userSource.setSource(newsource)
                                        userSource.sourceChanged(newsource)
                                    }else 
                                        {
                                            
                                        }
                                        console.log(ListItemData.shots_count)
                                    }
                                }
                            }
                        ]
                        layout: GridListLayout {
                            columnCount: 2
                            cellAspectRatio: 1.0
                            orientation: LayoutOrientation.TopToBottom
                        
                        }
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                        layoutProperties: StackLayoutProperties {
                        
                        }
                    
                    }
                    attachedObjects: [
                        DataSource {
                            id: userSource
                            source: userDS
                            remote: true
                            onDataLoaded: {
                                shotslistview.dataModel.append(data.shots)
                            }
                            onSourceChanged: {
                                userSource.load()
                            }
                            type: DataSourceType.Json
                        }
                    ]
                    
                    onCreationCompleted: {
                    //    userSource.load()
                      //  console.log(userSource.source)
                    }
                
                }
            
        
}


           
        } 
            
            actions: [
                ActionItem {
                    title: "Back"
                    
                    onTriggered: {
                        usershotsSheet.close()
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
                        usershotsSheet.close()
            }

                }

            }

        }
        onCreationCompleted: {
          //  userSource.load()
        }
       
        
        

    } 
    onOpened: {
        userSource.load()
    }    
    } 
    

 