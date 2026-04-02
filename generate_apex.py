#!/usr/bin/env python3
import os
import random

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
CLASSES_DIR = os.path.join(BASE_DIR, "force-app", "main", "default", "classes")
TRIGGERS_DIR = os.path.join(BASE_DIR, "force-app", "main", "default", "triggers")
LWCS_DIR = os.path.join(BASE_DIR, "force-app", "main", "default", "lwc")

os.makedirs(CLASSES_DIR, exist_ok=True)
os.makedirs(TRIGGERS_DIR, exist_ok=True)
os.makedirs(LWCS_DIR, exist_ok=True)

DOMAINS = [
    "Inventory", "Logistics", "Finance", "Marketing", "Sales", "Support",
    "Analytics", "Billing", "Shipping", "Compliance", "Onboarding", "Payroll",
    "Procurement", "Quality", "Research", "Training", "Vendor", "Warehouse",
    "Customer", "Product", "Order", "Invoice", "Payment", "Subscription",
    "Campaign", "Lead", "Opportunity", "Contract", "Ticket", "Project",
]

PATTERNS = ["Service", "Controller", "Handler", "Helper", "Batch", "Scheduler",
            "Selector", "Domain", "Factory", "Builder", "Validator", "Mapper",
            "Converter", "Processor", "Wrapper", "Utility", "Manager", "Provider",
            "Repository", "Gateway", "Adapter", "Strategy", "Observer", "Mediator"]

CLASS_TEMPLATE = '''public with sharing class {name} {{

    private static final String LOG_PREFIX = '{name}';
    private static final Integer MAX_RETRIES = 3;
    private static final Integer BATCH_SIZE = 200;

    private List<SObject> records;
    private Map<Id, SObject> recordMap;
    private Set<Id> processedIds;
    private Boolean isInitialized;
    private String contextName;

    public {name}() {{
        this.records = new List<SObject>();
        this.recordMap = new Map<Id, SObject>();
        this.processedIds = new Set<Id>();
        this.isInitialized = false;
        this.contextName = LOG_PREFIX;
    }}

    public {name}(List<SObject> inputRecords) {{
        this();
        this.records = inputRecords;
        this.isInitialized = true;
    }}

    public void initialize(List<SObject> inputRecords) {{
        if (this.isInitialized) {{
            return;
        }}
        this.records = inputRecords;
        for (SObject rec : inputRecords) {{
            if (rec.Id != null) {{
                this.recordMap.put(rec.Id, rec);
            }}
        }}
        this.isInitialized = true;
    }}

    public List<SObject> execute() {{
        if (!this.isInitialized) {{
            throw new {name}Exception('Not initialized. Call initialize() first.');
        }}

        List<SObject> results = new List<SObject>();
        Integer retryCount = 0;

        while (retryCount < MAX_RETRIES) {{
            try {{
                results = processRecords(this.records);
                break;
            }} catch (Exception e) {{
                retryCount++;
                if (retryCount >= MAX_RETRIES) {{
                    throw new {name}Exception(
                        'Max retries exceeded: ' + e.getMessage()
                    );
                }}
            }}
        }}

        for (SObject result : results) {{
            if (result.Id != null) {{
                this.processedIds.add(result.Id);
            }}
        }}

        return results;
    }}

    private List<SObject> processRecords(List<SObject> inputRecords) {{
        List<SObject> processed = new List<SObject>();
        List<List<SObject>> batches = splitIntoBatches(inputRecords, BATCH_SIZE);

        for (List<SObject> batch : batches) {{
            List<SObject> batchResults = processBatch(batch);
            processed.addAll(batchResults);
        }}

        return processed;
    }}

    private List<SObject> processBatch(List<SObject> batch) {{
        List<SObject> results = new List<SObject>();
        Map<String, Object> context = buildContext(batch);

        for (SObject record : batch) {{
            SObject processed = transformRecord(record, context);
            if (validateRecord(processed)) {{
                results.add(processed);
            }}
        }}

        return results;
    }}

    private SObject transformRecord(SObject record, Map<String, Object> context) {{
        return record;
    }}

    private Boolean validateRecord(SObject record) {{
        if (record == null) {{
            return false;
        }}
        return true;
    }}

    private Map<String, Object> buildContext(List<SObject> records) {{
        Map<String, Object> context = new Map<String, Object>();
        context.put('recordCount', records.size());
        context.put('timestamp', System.now());
        context.put('contextName', this.contextName);
        return context;
    }}

    private List<List<SObject>> splitIntoBatches(List<SObject> records, Integer batchSize) {{
        List<List<SObject>> batches = new List<List<SObject>>();
        List<SObject> currentBatch = new List<SObject>();

        for (SObject record : records) {{
            currentBatch.add(record);
            if (currentBatch.size() >= batchSize) {{
                batches.add(currentBatch);
                currentBatch = new List<SObject>();
            }}
        }}

        if (!currentBatch.isEmpty()) {{
            batches.add(currentBatch);
        }}

        return batches;
    }}

    public Set<Id> getProcessedIds() {{
        return this.processedIds;
    }}

    public Boolean isReady() {{
        return this.isInitialized;
    }}

    public class {name}Exception extends Exception {{}}
}}
'''

CLASS_META = '''<?xml version="1.0" encoding="UTF-8"?>
<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>59.0</apiVersion>
    <status>Active</status>
</ApexClass>
'''

TRIGGER_TEMPLATE = '''trigger {name} on {obj} (before insert, before update, after insert, after update, before delete, after delete) {{
    if (Trigger.isBefore) {{
        if (Trigger.isInsert) {{
            {handler}.handleBeforeInsert(Trigger.new);
        }}
        if (Trigger.isUpdate) {{
            {handler}.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        }}
        if (Trigger.isDelete) {{
            {handler}.handleBeforeDelete(Trigger.old);
        }}
    }}
    if (Trigger.isAfter) {{
        if (Trigger.isInsert) {{
            {handler}.handleAfterInsert(Trigger.new);
        }}
        if (Trigger.isUpdate) {{
            {handler}.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        }}
        if (Trigger.isDelete) {{
            {handler}.handleAfterDelete(Trigger.old);
        }}
    }}
}}
'''

TRIGGER_META = '''<?xml version="1.0" encoding="UTF-8"?>
<ApexTrigger xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>59.0</apiVersion>
    <status>Active</status>
</ApexTrigger>
'''

LWC_JS_TEMPLATE = '''import {{ LightningElement, api, wire, track }} from 'lwc';
import getRecords from '@salesforce/apex/{service_class}.getRecords';
import updateRecord from '@salesforce/apex/{service_class}.updateRecord';
import {{ ShowToastEvent }} from 'lightning/platformShowToastEvent';
import {{ refreshApex }} from '@salesforce/apex';
import {{ getObjectInfo }} from 'lightning/uiObjectInfoApi';
import {{ getPicklistValues }} from 'lightning/uiObjectInfoApi';

const COLUMNS = [
    {{ label: 'Name', fieldName: 'Name', type: 'text', sortable: true }},
    {{ label: 'Status', fieldName: 'Status__c', type: 'text', sortable: true }},
    {{ label: 'Amount', fieldName: 'Amount__c', type: 'currency', sortable: true }},
    {{ label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: true }},
    {{ label: 'Owner', fieldName: 'OwnerName', type: 'text' }},
];

const PAGE_SIZE = 25;
const MAX_ROWS = 2000;

export default class {component_name} extends LightningElement {{
    @api recordId;
    @api objectApiName;
    @track records = [];
    @track columns = COLUMNS;
    @track sortBy = 'Name';
    @track sortDirection = 'asc';
    @track isLoading = true;
    @track error;
    @track totalRecords = 0;
    @track pageNumber = 1;
    @track selectedRows = [];
    @track searchTerm = '';
    @track filterValue = 'All';

    _wiredResult;

    @wire(getRecords, {{
        recordId: '$recordId',
        pageSize: PAGE_SIZE,
        pageNumber: '$pageNumber',
        sortBy: '$sortBy',
        sortDirection: '$sortDirection',
        searchTerm: '$searchTerm',
        filterValue: '$filterValue'
    }})
    wiredRecords(result) {{
        this._wiredResult = result;
        if (result.data) {{
            this.records = result.data.records.map(record => ({{
                ...record,
                OwnerName: record.Owner ? record.Owner.Name : ''
            }}));
            this.totalRecords = result.data.totalRecords;
            this.error = undefined;
        }} else if (result.error) {{
            this.error = result.error;
            this.records = [];
        }}
        this.isLoading = false;
    }}

    get totalPages() {{
        return Math.ceil(this.totalRecords / PAGE_SIZE);
    }}

    get isFirstPage() {{
        return this.pageNumber <= 1;
    }}

    get isLastPage() {{
        return this.pageNumber >= this.totalPages;
    }}

    get hasRecords() {{
        return this.records && this.records.length > 0;
    }}

    get pageInfo() {{
        const start = (this.pageNumber - 1) * PAGE_SIZE + 1;
        const end = Math.min(this.pageNumber * PAGE_SIZE, this.totalRecords);
        return `${{start}}-${{end}} of ${{this.totalRecords}}`;
    }}

    handleSort(event) {{
        this.sortBy = event.detail.fieldName;
        this.sortDirection = event.detail.sortDirection;
        this.isLoading = true;
    }}

    handleSearch(event) {{
        this.searchTerm = event.target.value;
        this.pageNumber = 1;
        this.isLoading = true;
    }}

    handleFilterChange(event) {{
        this.filterValue = event.detail.value;
        this.pageNumber = 1;
        this.isLoading = true;
    }}

    handlePrevious() {{
        if (!this.isFirstPage) {{
            this.pageNumber--;
            this.isLoading = true;
        }}
    }}

    handleNext() {{
        if (!this.isLastPage) {{
            this.pageNumber++;
            this.isLoading = true;
        }}
    }}

    handleRowSelection(event) {{
        this.selectedRows = event.detail.selectedRows;
    }}

    async handleSave() {{
        if (this.selectedRows.length === 0) {{
            this.showToast('Warning', 'Please select at least one record', 'warning');
            return;
        }}

        this.isLoading = true;
        try {{
            await updateRecord({{ records: this.selectedRows }});
            this.showToast('Success', `${{this.selectedRows.length}} records updated`, 'success');
            await refreshApex(this._wiredResult);
        }} catch (error) {{
            this.showToast('Error', error.body?.message || 'An error occurred', 'error');
        }} finally {{
            this.isLoading = false;
        }}
    }}

    handleRefresh() {{
        this.isLoading = true;
        refreshApex(this._wiredResult);
    }}

    showToast(title, message, variant) {{
        this.dispatchEvent(new ShowToastEvent({{ title, message, variant }}));
    }}

    connectedCallback() {{
        this.isLoading = true;
    }}

    renderedCallback() {{
        if (this.hasRecords && !this._chartsRendered) {{
            this._chartsRendered = true;
        }}
    }}
}}
'''

LWC_HTML_TEMPLATE = '''<template>
    <lightning-card title="{title}" icon-name="standard:record">
        <div slot="actions">
            <lightning-button-group>
                <lightning-button label="Refresh" icon-name="utility:refresh" onclick={{handleRefresh}}></lightning-button>
                <lightning-button label="Save" variant="brand" icon-name="utility:save" onclick={{handleSave}}></lightning-button>
            </lightning-button-group>
        </div>
        <div class="slds-p-around_medium">
            <div class="slds-grid slds-gutters slds-m-bottom_medium">
                <div class="slds-col slds-size_1-of-2">
                    <lightning-input type="search" label="Search" value={{searchTerm}} onchange={{handleSearch}} placeholder="Search records..."></lightning-input>
                </div>
                <div class="slds-col slds-size_1-of-2">
                    <lightning-combobox label="Filter" value={{filterValue}} options={{filterOptions}} onchange={{handleFilterChange}}></lightning-combobox>
                </div>
            </div>
            <template if:true={{isLoading}}>
                <lightning-spinner alternative-text="Loading" size="medium"></lightning-spinner>
            </template>
            <template if:true={{error}}>
                <div class="slds-text-color_error slds-p-around_small">{{error}}</div>
            </template>
            <template if:true={{hasRecords}}>
                <lightning-datatable key-field="Id" data={{records}} columns={{columns}} sorted-by={{sortBy}} sorted-direction={{sortDirection}} onsort={{handleSort}} onrowselection={{handleRowSelection}} show-row-number-column max-row-selection="50"></lightning-datatable>
                <div class="slds-grid slds-grid_align-center slds-m-top_medium">
                    <lightning-button label="Previous" icon-name="utility:chevronleft" onclick={{handlePrevious}} disabled={{isFirstPage}}></lightning-button>
                    <span class="slds-p-horizontal_medium slds-align-middle">{{pageInfo}}</span>
                    <lightning-button label="Next" icon-name="utility:chevronright" icon-position="right" onclick={{handleNext}} disabled={{isLastPage}}></lightning-button>
                </div>
            </template>
        </div>
    </lightning-card>
</template>
'''

LWC_META_TEMPLATE = '''<?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>59.0</apiVersion>
    <isExposed>true</isExposed>
    <targets>
        <target>lightning__RecordPage</target>
        <target>lightning__AppPage</target>
        <target>lightning__HomePage</target>
    </targets>
    <targetConfigs>
        <targetConfig targets="lightning__RecordPage">
            <property name="title" type="String" label="Title" default="{title}"/>
            <property name="pageSize" type="Integer" label="Page Size" default="25"/>
        </targetConfig>
    </targetConfigs>
</LightningComponentBundle>
'''

LWC_CSS_TEMPLATE = '''.slds-p-around_medium {{
    padding: 1rem;
}}

:host {{
    display: block;
}}

lightning-datatable {{
    --sds-c-table-header-color-background: #f3f3f3;
    min-height: 200px;
}}

.slds-align-middle {{
    display: flex;
    align-items: center;
    font-size: 0.875rem;
    color: #706e6b;
}}
'''

def generate():
    total_bytes = 0
    total_files = 0
    random.seed(99)

    class_names = []
    for domain in DOMAINS:
        for pattern in PATTERNS:
            name = f"{domain}{pattern}"
            class_names.append(name)

    for name in class_names:
        content = CLASS_TEMPLATE.format(name=name)
        cls_file = os.path.join(CLASSES_DIR, f"{name}.cls")
        meta_file = os.path.join(CLASSES_DIR, f"{name}.cls-meta.xml")
        with open(cls_file, "w") as f:
            f.write(content)
        with open(meta_file, "w") as f:
            f.write(CLASS_META)
        total_bytes += len(content.encode()) + len(CLASS_META.encode())
        total_files += 2

        test_name = f"{name}Test"
        test_content = f'''@isTest
private class {test_name} {{

    @TestSetup
    static void setup() {{
        List<SObject> testRecords = new List<SObject>();
        for (Integer i = 0; i < 200; i++) {{
            testRecords.add(new Account(Name = 'Test Account ' + i));
        }}
        insert testRecords;
    }}

    @isTest
    static void testExecute() {{
        List<SObject> records = [SELECT Id, Name FROM Account LIMIT 200];
        {name} instance = new {name}(records);
        Test.startTest();
        List<SObject> results = instance.execute();
        Test.stopTest();
        System.assertNotEquals(null, results, 'Results should not be null');
    }}

    @isTest
    static void testInitialize() {{
        List<SObject> records = [SELECT Id, Name FROM Account LIMIT 50];
        {name} instance = new {name}();
        instance.initialize(records);
        System.assertEquals(true, instance.isReady(), 'Should be initialized');
    }}

    @isTest
    static void testExecuteWithoutInit() {{
        {name} instance = new {name}();
        Boolean exceptionThrown = false;
        try {{
            instance.execute();
        }} catch ({name}.{name}Exception e) {{
            exceptionThrown = true;
        }}
        System.assertEquals(true, exceptionThrown, 'Should throw exception');
    }}

    @isTest
    static void testGetProcessedIds() {{
        List<SObject> records = [SELECT Id, Name FROM Account LIMIT 10];
        {name} instance = new {name}(records);
        instance.execute();
        Set<Id> processed = instance.getProcessedIds();
        System.assertNotEquals(null, processed, 'Processed IDs should not be null');
    }}

    @isTest
    static void testBulkProcessing() {{
        List<SObject> records = [SELECT Id, Name FROM Account LIMIT 200];
        {name} instance = new {name}();
        instance.initialize(records);
        Test.startTest();
        List<SObject> results = instance.execute();
        Test.stopTest();
        System.assert(results.size() > 0, 'Should process records in bulk');
    }}
}}
'''
        test_file = os.path.join(CLASSES_DIR, f"{test_name}.cls")
        test_meta = os.path.join(CLASSES_DIR, f"{test_name}.cls-meta.xml")
        with open(test_file, "w") as f:
            f.write(test_content)
        with open(test_meta, "w") as f:
            f.write(CLASS_META)
        total_bytes += len(test_content.encode()) + len(CLASS_META.encode())
        total_files += 2

    print(f"Apex classes: {total_files} files, {total_bytes/1e6:.1f} MB")

    trigger_count = 0
    for domain in DOMAINS:
        for suffix in ["Handler", "Service", "Processor"]:
            obj_name = f"{domain}_{suffix}__c"
            handler_name = f"{domain}{suffix}Handler"
            trigger_name = f"{domain}{suffix}Trigger"
            content = TRIGGER_TEMPLATE.format(
                name=trigger_name, obj=obj_name, handler=handler_name
            )
            t_file = os.path.join(TRIGGERS_DIR, f"{trigger_name}.trigger")
            t_meta = os.path.join(TRIGGERS_DIR, f"{trigger_name}.trigger-meta.xml")
            with open(t_file, "w") as f:
                f.write(content)
            with open(t_meta, "w") as f:
                f.write(TRIGGER_META)
            total_bytes += len(content.encode()) + len(TRIGGER_META.encode())
            total_files += 2
            trigger_count += 1

    print(f"Triggers: {trigger_count * 2} files")

    lwc_count = 0
    for domain in DOMAINS:
        for pattern in ["List", "Detail", "Form", "Dashboard", "Card", "Table", "Modal", "Chart"]:
            comp_pascal = f"{domain}{pattern}"
            comp_camel = comp_pascal[0].lower() + comp_pascal[1:]
            comp_dir = os.path.join(LWCS_DIR, comp_camel)
            os.makedirs(comp_dir, exist_ok=True)

            service = f"{domain}Service"
            title = f"{domain} {pattern}"

            js_content = LWC_JS_TEMPLATE.format(
                service_class=service,
                component_name=comp_pascal,
                title=title,
            )
            html_content = LWC_HTML_TEMPLATE.format(title=title)
            meta_content = LWC_META_TEMPLATE.format(title=title)
            css_content = LWC_CSS_TEMPLATE

            for fname, content in [
                (f"{comp_camel}.js", js_content),
                (f"{comp_camel}.html", html_content),
                (f"{comp_camel}.js-meta.xml", meta_content),
                (f"{comp_camel}.css", css_content),
            ]:
                fpath = os.path.join(comp_dir, fname)
                with open(fpath, "w") as f:
                    f.write(content)
                total_bytes += len(content.encode())
                total_files += 1
                lwc_count += 1

    print(f"LWC components: {lwc_count} files")
    print(f"\nApex/LWC total: {total_files:,} files, {total_bytes/1e6:.1f} MB")

if __name__ == "__main__":
    generate()
