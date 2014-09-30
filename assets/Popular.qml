
/*this app was developed by Ali Aljowaher [AZ labs]
 * for details email me ali.aljowaher@gmail.com
 * all right reserved 
 */

import bb.cascades 1.2
import bb.system 1.2
import bb.data 1.0

import org.labsquare 1.0

NavigationPane {
    id: nav

    Page {
        id: popularpage
        content: Container {

            id: titlebar
            background: Color.Black
            //opacity: 1.0

            Container {
                id: title

                preferredHeight: 110
                leftPadding: 30
                
                // changed to fill so that it will fit all screen widths
                horizontalAlignment: HorizontalAlignment.Fill
                background: Color.create("#ea4c89")
                
                // changed to dock so that if you change the height of the header the label will always be center
                layout: DockLayout {
                }

                //                preferredWidth: 768
                //                horizontalAlignment: HorizontalAlignment.Left
                //                topPadding: 30.0
                //                layoutProperties: FlowListLayoutProperties {
                //                }
                //                verticalAlignment: VerticalAlignment.Center

                
                Label {
                    id: name
                    text: "POPULAR" + Retranslate.onLocaleOrLanguageChanged
                    textStyle.color: Color.White
                    textStyle.fontWeight: FontWeight.Bold
                    textStyle.fontSize: FontSize.Large
                    horizontalAlignment: HorizontalAlignment.Left
                    verticalAlignment: VerticalAlignment.Center
                }
            }
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            ListView {
                scrollRole: ScrollRole.Main
                id: lvDemo
                dataModel: ArrayDataModel {
                    id: datamodel
                }
                listItemComponents: [
                    ListItemComponent {
                        WebImageView {
                            url: ListItemData.image_teaser_url
                            //                            preferredHeight: 384
                            //                            maxHeight: 384
                            //                            preferredWidth: 384
                            //                            horizontalAlignment: HorizontalAlignment.Center
                            //                            verticalAlignment: VerticalAlignment.Center
                            //                            leftMargin: 10
                            //                            rightMargin: 10
                            //                            topMargin: 10
                            //                            bottomMargin: 10

                            // Changed to aspectfill so that the image does not look squished
                            scalingMethod: ScalingMethod.AspectFill
                            
                        }
                    }
                ]
                onTriggered: {
                    var myitem = datamodel.data(indexPath);
                    var page = pageDefinition.createObject();
                    page.thetitle = myitem.title;
                    page.theimage = myitem.image_url;
                    page.likes = myitem.likes_count;
                    page.views = myitem.views_count;
                    page.user_image = myitem.player.avatar_url;
                    page.commentsCount = myitem.comments_count;
                    page.userName = myitem.player.username;
                    page.urlLink = myitem.short_url;
                    page.shot_id = myitem.id
                    page.player_id = myitem.player.id
                    if (myitem.player.twitter_screen_name == null) {
                        page.twitrUser = myitem.player.username

                    } else {
                        page.twitrUser = myitem.player.twitter_screen_name
                    }
                    if (myitem.description == null) {
                        page.descript = ""
                    
                    } else {
                        page.descript = myitem.description
                    }
                    page.userUrl = myitem.player.url
                    nav.push(page);

                }
                attachedObjects: [
                    ComponentDefinition {
                        id: pageDefinition
                        source: "Shotpage.qml"
                    },
                    ListScrollStateHandler {
                        id: scrollend
                        property int pagenumber: 1
                        onAtEndChanged: {
                            if (atEnd) {
                                var newpage = pagenumber ++
                                var newsource = "http://api.dribbble.com/shots/popular?per_page=30;page=" + newpage
                                svcDataSource.setSource(newsource)
                                svcDataSource.sourceChanged(newsource)
                            }
                        }
                    }
                ]
                //leadingVisualSnapThreshold: 0.2
                layout: GridListLayout {
                    columnCount: 2
                    // removes item gap. to me the gap is distracting
                    horizontalCellSpacing: 0.0
                    spacingBeforeHeader: 0.0
                    verticalCellSpacing: 0.0
                }
               

                //                scrollIndicatorMode: ScrollIndicatorMode.ProportionalBar
                //                verticalAlignment: VerticalAlignment.Center
                //                bottomMargin: 10.0
            }
            /* allowing for view switching to three images row insted of two
             * gestureHandlers: PinchHandler {
                onPinchUpdated: {
                    
                    lvDemo.layout.columnCount = 3
                }
                
               
            }*/

        }
        attachedObjects: [
            
            DataSource {
                source: "http://api.dribbble.com/shots/popular?per_page=30;page=1"
                id: svcDataSource
                remote: true
                onDataLoaded: {
                    lvDemo.dataModel.append(data.shots)
                }
                onSourceChanged: {
                    load()
                }
                type: DataSourceType.Json
            }
        ]
        onCreationCompleted: {
            svcDataSource.load();
        }
        actionBarVisibility: ChromeVisibility.Hidden
        actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    }
    onPopTransitionEnded: {
        page.destroy();

    }
}
