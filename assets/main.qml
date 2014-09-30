/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*this app was developed by Ali Aljowaher [AZ labs]
 * for details email me ali.aljowaher@gmail.com
 * all right reserved 
 */

import bb.cascades 1.2
import bb.system 1.2
import bb.data 1.0
import org.labsquare 1.0 /* library to load image from url */

TabbedPane {
    id: mytabs
    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                title: "About" + Retranslate.onLocaleOrLanguageChanged
                imageSource: "asset:///images/info.png"
                onTriggered: {
                    aboutsheet.open()
                }
            },
            ActionItem {
                title: "Invite" + Retranslate.onLocaleOrLanguageChanged
                imageSource: "asset:///images/ic_bbm.png"
                onTriggered: {
                    inviteToDownload.sendInvite();
                }
            }
        ]
    }

    showTabsOnActionBar: false

    //  sidebarState: SidebarState.VisibleCompact

    Tab { //Popular tab
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("POPULAR") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/036.%20Star.png"
        id: popular
        Popular {
            id: popularpage
            //      actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
        }
    } //End of popular tab

    Tab { //everyone tab
        title: qsTr("EVERYONE") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/162.%20Group.png"

        id: everyone
        Everyone {
            id: everyonepage
            //    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
        }

    } //End of everyone tab
    Tab { //debuts tab
        title: qsTr("DEBUTS") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/129.%20Chequered%20flag.png"
        id: debuts
        Debuts {
            id: debutspage
            //   actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
        }

    } //end of debuts tab
   
    attachedObjects: Sheet {
        id: aboutsheet
        Aboutpage {
            id: about
        }
    }
}//end of tabed pane
