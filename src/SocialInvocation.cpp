/* Copyright (c) 2013 BlackBerry Limited.
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
#include "SocialInvocation.hpp"

#include <bb/system/InvokeRequest>
#include <bb/cascades/Application>
#include <bb/system/CardDoneMessage>
#include <bb/data/JsonDataAccess>
#include <bb/system/SystemToast>

using namespace bb::cascades;
using namespace bb::system;
using namespace bb::data;


//! [0]
SocialInvocation::SocialInvocation(QObject *parent) :
		QObject(parent), m_invokeManager(new InvokeManager(this)) {

}


QByteArray SocialInvocation::encodeQString(const QString& toEncode) const {
	return toEncode.toUtf8();
}
void SocialInvocation::invoke(const QString &target, const QString &action,
		const QString &mimetype, const QString &uri) {
	// Create a new invocation request
	InvokeRequest request;

	request.setTarget(target);
	request.setAction(action);
	request.setUri(uri);

	m_invokeManager->invoke(request);
}








