// Default empty project template
#include "ImageExample.hpp"
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include "WebImageView.h"
#include <bb/cascades/Button>
#include "RegistrationHandler.hpp"
#include "InviteToDownload.hpp"
#include <bb/system/SystemDialog>
#include "support/qmlbeam.h"
using namespace bb::cascades;
using namespace bb::system;

ImageExample::ImageExample(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime

	qmlRegisterType<WebImageView>("org.labsquare", 1, 0, "WebImageView");
	 const QUuid uuid(QLatin1String("998548f6-7511-454e-87c0-27af17c63e61"));

	        // Register with BBM.
	        registrationHandler = new RegistrationHandler(uuid, app);
	        inviteToDownload = new InviteToDownload(&registrationHandler->context());


    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    // create root object for the UI

    AbstractPane *root = qml->createRootObject<AbstractPane>();
    // set created root object as a scene
    qml->setContextProperty("inviteToDownload", inviteToDownload);

    app->setScene(root);

    //new QmlBeam(this);
}

