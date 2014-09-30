import bb.cascades 1.2
import bb.system 1.2
import bb.data 1.0

NavigationPane {
    id: aboutNavPane

    Page {

        id: about
        actions: [
            ActionItem {
                title: "Support"
                imageSource: "asset:///images/ic_email.png"
                ActionBar.placement: ActionBarPlacement.OnBar

                onTriggered: {
                    emailInvocation.query.uri = "mailto:azlabs.apps@gmail.com?subject=Support Request"
                    emailInvocation.query.updateQuery();
                }
                attachedObjects: [
                    Invocation {
                        id: emailInvocation
                        query.mimeType: "text/plain"
                        query.invokeTargetId: "sys.pim.uib.email.hybridcomposer"
                        query.invokeActionId: "bb.action.SENDEMAIL"
                        onArmed: {
                            emailInvocation.trigger(emailInvocation.query.invokeActionId);
                        }
                    }
                ]
            },
            ActionItem {
                title: "Website"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    Qt.openUrlExternally("http://azlabs.tumblr.com/")
                }
                imageSource: "asset:///images/ic_browser.png"
            },
            ActionItem {
                title: "Twitter"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    Qt.openUrlExternally("https://twitter.com/AZlabsapps")
                }
                imageSource: "asset:///images/twitter_logo.png"
            }

        ]

        titleBar: TitleBar {

        }
        Container {

            
            layout: StackLayout {

            }

            bottomPadding: 7.0
            layoutProperties: StackLayoutProperties {

            }
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            background: Color.create("#ea4c89")
            Container {
                preferredHeight: 110
                minWidth: 768
                background: Color.Black
                rightPadding: 150
                ImageButton {
                    preferredHeight: 80
                    preferredWidth: 80
                    defaultImageSource: "asset:///images/ic_previous.png"
                    onClicked: {
                        aboutsheet.close()
                    }
                    verticalAlignment: VerticalAlignment.Center
                }
                Label {

                    text: "About"
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.color: Color.White
                    textStyle.fontSize: FontSize.Large
                    leftMargin: 250.0
                }
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                layoutProperties: StackLayoutProperties {

                }
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight

                }

            }

            ImageView {
                imageSource: "asset:///images/icon.png"
                preferredWidth: 320
                preferredHeight: 320
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
            }

            Label {
                text: "Pixlez for BlackBerry 10"
                textStyle.fontSize: FontSize.XLarge
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.color: Color.White

            }

            Label {
                id: appinfo

                text: "My first App Experiment !!"
                textStyle.fontSize: FontSize.Large
                textStyle.fontWeight: FontWeight.W400
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                textStyle.color: Color.White
                touchPropagationMode: TouchPropagationMode.None
                textStyle.textAlign: TextAlign.Left

            }
            Label {
                text: " Powered by "
                textStyle.fontSize: FontSize.Small
                textStyle.fontWeight: FontWeight.Bold
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.color: Color.White
               

            }
            ImageView {
                imageSource: "asset:///images/dribbble-logo.png"
                    preferredHeight: 140
                    preferredWidth: 400
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
            }

            ImageView {
                imageSource: "asset:///images/azlabs_circle_logo.png"
                maxHeight: 150
                maxWidth: 150
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
            }
            Label {

                text: "version : " + Application.applicationVersion
                textStyle.fontSize: FontSize.Small
                textStyle.fontWeight: FontWeight.Bold
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.color: Color.White
            }
        }
        
        paneProperties: NavigationPaneProperties {
            backButton: ActionItem {
                title: "Back"
                onTriggered: {
                    aboutNavPane.pop();
                }
            }
        }
        //  actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
        // actionBarVisibility: ChromeVisibility.Hidden
    }

}