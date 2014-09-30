import bb.cascades 1.2

Page {
    property alias url : weburl.url
    Container {
        layout: DockLayout {

        }
        ScrollView {
            // this will disable the scroll effect when you reach the top or bottom but it does not work 100%
            //scrollViewProperties.overScrollEffectMode: OverScrollEffectMode.None

            WebView {
                id:weburl
                onLoadProgressChanged: {
                    loadingbar.value = loadProgress
                }
                onLoadingChanged: {
                    if (loadRequest.status == WebLoadStatus.Succeeded) {
                        loadingbar.visible = false;
                    }
                }
                accessibility.name: "Current Web Page"
            }
        }
        ProgressIndicator {
            fromValue: 0
            toValue: 100
            id: loadingbar
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Fill
            accessibility.name: "Web Page Loading Progress"
        }
    }
    
}
