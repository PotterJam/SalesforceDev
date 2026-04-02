#!/usr/bin/env python3
import os
import random

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
OBJECTS_DIR = os.path.join(BASE_DIR, "objects")
CLASSES_DIR = os.path.join(BASE_DIR, "classes")
TRIGGERS_DIR = os.path.join(BASE_DIR, "triggers")
PAGES_DIR = os.path.join(BASE_DIR, "pages")
LAYOUTS_DIR = os.path.join(BASE_DIR, "layouts")
TABS_DIR = os.path.join(BASE_DIR, "tabs")
FLOWS_DIR = os.path.join(BASE_DIR, "flows")
LABELS_DIR = os.path.join(BASE_DIR, "labels")
QUICK_ACTIONS_DIR = os.path.join(BASE_DIR, "quickActions")

for d in [TRIGGERS_DIR, PAGES_DIR, FLOWS_DIR]:
    os.makedirs(d, exist_ok=True)

FIELD_TYPES = [
    ("Text", "<length>255</length>\n        <required>false</required>"),
    ("Number", "<precision>18</precision>\n        <scale>2</scale>\n        <required>false</required>"),
    ("Checkbox", "<defaultValue>false</defaultValue>"),
    ("Date", "<required>false</required>"),
    ("DateTime", "<required>false</required>"),
    ("Email", "<required>false</required>"),
    ("Phone", "<required>false</required>"),
    ("Percent", "<precision>18</precision>\n        <scale>2</scale>\n        <required>false</required>"),
    ("Currency", "<precision>18</precision>\n        <scale>2</scale>\n        <required>false</required>"),
    ("Url", "<required>false</required>"),
    ("TextArea", "<required>false</required>"),
    ("LongTextArea", "<length>32768</length>\n        <visibleLines>5</visibleLines>"),
]

DOMAINS = [
    "Inventory", "Logistics", "Finance", "Marketing", "Sales", "Support",
    "Analytics", "Billing", "Shipping", "Compliance", "Onboarding", "Payroll",
    "Procurement", "Quality", "Research", "Training", "Vendor", "Warehouse",
    "Customer", "Product", "Order", "Invoice", "Payment", "Subscription",
    "Campaign", "Lead", "Opportunity", "Contract", "Ticket", "Project",
    "Resource", "Budget", "Forecast", "Pipeline", "Territory", "Commission",
    "Discount", "Promotion", "Segment", "Channel", "Partner", "Affiliate",
    "Referral", "Feedback", "Survey", "Rating", "Review", "Benchmark",
    "Metric", "Dashboard", "Report", "Alert", "Notification", "Workflow",
    "Approval", "Escalation", "Priority", "Category", "Tag", "Label",
    "Status", "Phase", "Milestone", "Deliverable", "Dependency", "Risk",
    "Issue", "Resolution", "Impact", "Severity", "Frequency", "Duration",
    "Capacity", "Utilization", "Allocation", "Assignment", "Schedule", "Shift",
    "Coverage", "Quota", "Target", "Actual", "Variance", "Trend",
    "Baseline", "Threshold", "Limit", "Ceiling", "Floor", "Range",
    "Tier", "Level", "Grade", "Score", "Index", "Ratio",
]

SUFFIXES = [
    "Tracker", "Manager", "Handler", "Processor", "Controller", "Service",
    "Record", "Entry", "Item", "Detail", "Summary", "Log",
    "Config", "Setting", "Preference", "Rule", "Policy", "Template",
    "Request", "Response", "Transaction", "Event", "Action", "Task",
    "Queue", "Batch", "Job", "Process", "Flow", "Stage",
    "Node", "Link", "Bridge", "Gateway", "Hub", "Relay",
    "Cache", "Store", "Registry", "Catalog", "Archive", "Backup",
    "Audit", "Plan", "Snapshot", "Delta", "Stream", "Feed",
    "Mapping", "Transform", "Filter", "Aggregate", "Trigger", "Hook",
    "Endpoint", "Proxy", "Adapter", "Connector", "Plugin", "Module",
    "Schema", "Model", "View", "Binding", "Route", "Dispatch",
]

FIELD_NAMES = [
    "Amount", "Quantity", "Price", "Cost", "Total", "Subtotal", "Tax",
    "Discount", "Margin", "Profit", "Revenue", "Balance", "Credit", "Debit",
    "Rate", "Factor", "Weight", "Volume", "Length", "Width", "Height",
    "StartDate", "EndDate", "DueDate", "CreatedDate", "ModifiedDate",
    "Status", "Type", "Category", "Priority", "Severity", "Level",
    "Name", "Title", "Description", "Notes", "Comments", "Tags",
    "Email", "Phone", "Address", "City", "State", "Country", "ZipCode",
    "IsActive", "IsDeleted", "IsArchived", "IsLocked", "IsPublished",
    "Owner", "Assignee", "Reviewer", "Approver", "Creator", "Modifier",
    "Source", "Target", "Origin", "Destination", "Channel", "Medium",
    "Code", "Reference", "Identifier", "Number", "Sequence", "Index",
    "Min", "Max", "Average", "Median", "Count", "Sum", "Percentage",
    "Threshold", "Limit", "Ceiling", "Floor", "Baseline", "Benchmark",
    "Score", "Rating", "Rank", "Grade", "Tier", "Segment",
    "Duration", "Frequency", "Interval", "Period", "Cycle", "Iteration",
    "Latitude", "Longitude", "Timezone", "Locale", "Currency", "Language",
    "Version", "Revision", "Build", "Release", "Patch", "Update",
    "Retry", "Timeout", "Delay", "Buffer", "Cache", "Queue",
    "Input", "Output", "Result", "Outcome", "Response", "Feedback",
    "Risk", "Impact", "Probability", "Exposure", "Mitigation", "Contingency",
    "Budget", "Forecast", "Actual", "Variance", "Deviation", "Tolerance",
    "Capacity", "Utilization", "Allocation", "Availability", "Throughput", "Latency",
]

ACTIONS = [
    "Accept", "CancelEdit", "Clone", "Delete", "Edit", "List",
    "New", "SaveEdit", "Tab", "View",
]

TARGET_BYTES = 1_050_000_000
NUM_OBJECTS = 3500
FIELDS_PER_OBJECT = 500

def build_object_xml(obj_label, fields_per):
    parts = []
    parts.append('<?xml version="1.0" encoding="UTF-8"?>')
    parts.append('<CustomObject xmlns="http://soap.sforce.com/2006/04/metadata">')

    for action in ACTIONS:
        parts.append(f"    <actionOverrides>")
        parts.append(f"        <actionName>{action}</actionName>")
        parts.append(f"        <type>Default</type>")
        parts.append(f"    </actionOverrides>")
        parts.append(f"    <actionOverrides>")
        parts.append(f"        <actionName>{action}</actionName>")
        parts.append(f"        <formFactor>Large</formFactor>")
        parts.append(f"        <type>Default</type>")
        parts.append(f"    </actionOverrides>")
        parts.append(f"    <actionOverrides>")
        parts.append(f"        <actionName>{action}</actionName>")
        parts.append(f"        <formFactor>Small</formFactor>")
        parts.append(f"        <type>Default</type>")
        parts.append(f"    </actionOverrides>")

    parts.append("    <allowInChatterGroups>true</allowInChatterGroups>")
    parts.append("    <compactLayoutAssignment>SYSTEM</compactLayoutAssignment>")
    parts.append("    <deploymentStatus>Deployed</deploymentStatus>")
    parts.append("    <enableActivities>true</enableActivities>")
    parts.append("    <enableBulkApi>true</enableBulkApi>")
    parts.append("    <enableFeeds>false</enableFeeds>")
    parts.append("    <enableHistory>true</enableHistory>")
    parts.append("    <enableLicensing>false</enableLicensing>")
    parts.append("    <enableReports>true</enableReports>")
    parts.append("    <enableSearch>true</enableSearch>")
    parts.append("    <enableSharing>true</enableSharing>")
    parts.append("    <enableStreamingApi>true</enableStreamingApi>")
    parts.append("    <externalSharingModel>Private</externalSharingModel>")

    used = set()
    for i in range(fields_per):
        base = FIELD_NAMES[i % len(FIELD_NAMES)]
        variant = i // len(FIELD_NAMES)
        fn = base if variant == 0 else f"{base}_{variant}"
        if fn in used:
            fn = f"{fn}_{i}"
        used.add(fn)
        api = f"{fn}__c"
        label = fn.replace("_", " ")
        ft_idx = i % len(FIELD_TYPES)
        ftype, fspecific = FIELD_TYPES[ft_idx]

        parts.append("    <fields>")
        parts.append(f"        <fullName>{api}</fullName>")
        parts.append(f"        <description>Stores the {label.lower()} value for {obj_label} records used in reporting and automation.</description>")
        parts.append(f"        <externalId>false</externalId>")
        parts.append(f"        <inlineHelpText>Enter the {label.lower()} for this record.</inlineHelpText>")
        parts.append(f"        <label>{label}</label>")
        parts.append(f"        <trackHistory>false</trackHistory>")
        parts.append(f"        <trackTrending>false</trackTrending>")
        parts.append(f"        <type>{ftype}</type>")
        parts.append(f"        {fspecific}")
        parts.append(f"        <unique>false</unique>")
        parts.append("    </fields>")

    parts.append(f"    <label>{obj_label}</label>")
    parts.append("    <nameField>")
    parts.append(f"        <label>{obj_label} Name</label>")
    parts.append("        <type>Text</type>")
    parts.append("    </nameField>")
    parts.append(f"    <pluralLabel>{obj_label}s</pluralLabel>")
    parts.append("    <searchLayouts/>")
    parts.append("    <sharingModel>ReadWrite</sharingModel>")
    parts.append("    <visibility>Public</visibility>")
    parts.append("</CustomObject>")

    return "\n".join(parts)

CLS_TEMPLATE = '''public with sharing class {name} {{

    private static final String LOG_PREFIX = '{name}';
    private static final Integer MAX_RETRIES = 3;
    private static final Integer BATCH_SIZE = 200;

    private List<SObject> records;
    private Map<Id, SObject> recordMap;
    private Set<Id> processedIds;
    private Boolean isInitialized;

    public {name}() {{
        this.records = new List<SObject>();
        this.recordMap = new Map<Id, SObject>();
        this.processedIds = new Set<Id>();
        this.isInitialized = false;
    }}

    public {name}(List<SObject> inputRecords) {{
        this();
        this.records = inputRecords;
        this.isInitialized = true;
    }}

    public void initialize(List<SObject> inputRecords) {{
        if (this.isInitialized) return;
        this.records = inputRecords;
        for (SObject rec : inputRecords) {{
            if (rec.Id != null) this.recordMap.put(rec.Id, rec);
        }}
        this.isInitialized = true;
    }}

    public List<SObject> execute() {{
        if (!this.isInitialized) throw new {name}Exception('Not initialized');
        List<SObject> results = new List<SObject>();
        for (SObject rec : this.records) {{
            if (rec != null) {{
                results.add(rec);
                if (rec.Id != null) this.processedIds.add(rec.Id);
            }}
        }}
        return results;
    }}

    public Set<Id> getProcessedIds() {{ return this.processedIds; }}
    public Boolean isReady() {{ return this.isInitialized; }}
    public class {name}Exception extends Exception {{}}
}}
'''

CLS_META = '''<?xml version="1.0" encoding="UTF-8"?>
<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>59.0</apiVersion>
    <status>Active</status>
</ApexClass>
'''

TRIGGER_TEMPLATE = '''trigger {name} on {obj} (before insert, before update, after insert, after update, before delete, after delete) {{
    if (Trigger.isBefore) {{
        if (Trigger.isInsert) {handler}.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) {handler}.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) {handler}.handleBeforeDelete(Trigger.old);
    }}
    if (Trigger.isAfter) {{
        if (Trigger.isInsert) {handler}.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) {handler}.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) {handler}.handleAfterDelete(Trigger.old);
    }}
}}
'''

TRIGGER_META = '''<?xml version="1.0" encoding="UTF-8"?>
<ApexTrigger xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>59.0</apiVersion>
    <status>Active</status>
</ApexTrigger>
'''

PAGE_TEMPLATE = '''<apex:page controller="{controller}" showHeader="true" sidebar="true" lightningStylesheets="true">
    <apex:sectionHeader title="{title}" subtitle="Overview"/>
    <apex:form>
        <apex:pageBlock title="{title} Details" mode="edit">
            <apex:pageBlockButtons>
                <apex:commandButton value="Save" action="{{!save}}"/>
                <apex:commandButton value="Cancel" action="{{!cancel}}" immediate="true"/>
                <apex:commandButton value="Delete" action="{{!deleteRecord}}" onclick="return confirm('Are you sure?');"/>
            </apex:pageBlockButtons>
            <apex:pageBlockSection title="General Information" columns="2">
                <apex:inputField value="{{!record.Name}}"/>
                <apex:outputField value="{{!record.CreatedDate}}"/>
                <apex:outputField value="{{!record.LastModifiedDate}}"/>
                <apex:outputField value="{{!record.OwnerId}}"/>
            </apex:pageBlockSection>
            <apex:pageBlockSection title="Additional Details" columns="2">
                <apex:outputText value="{{!statusMessage}}"/>
                <apex:outputPanel rendered="{{!hasErrors}}">
                    <apex:pageMessages/>
                </apex:outputPanel>
            </apex:pageBlockSection>
        </apex:pageBlock>
        <apex:pageBlock title="Related Records">
            <apex:pageBlockTable value="{{!relatedRecords}}" var="item">
                <apex:column headerValue="Name" value="{{!item.Name}}"/>
                <apex:column headerValue="Status" value="{{!item.Status__c}}"/>
                <apex:column headerValue="Created" value="{{!item.CreatedDate}}"/>
            </apex:pageBlockTable>
        </apex:pageBlock>
    </apex:form>
</apex:page>
'''

PAGE_META = '''<?xml version="1.0" encoding="UTF-8"?>
<ApexPage xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>59.0</apiVersion>
    <availableInTouch>true</availableInTouch>
    <confirmationTokenRequired>false</confirmationTokenRequired>
    <label>{label}</label>
</ApexPage>
'''

LAYOUT_TEMPLATE = '''<?xml version="1.0" encoding="UTF-8"?>
<Layout xmlns="http://soap.sforce.com/2006/04/metadata">
    <layoutSections>
        <customLabel>false</customLabel>
        <detailHeading>false</detailHeading>
        <editHeading>true</editHeading>
        <label>Information</label>
        <layoutColumns>
            <layoutItems>
                <behavior>Required</behavior>
                <field>Name</field>
            </layoutItems>
            <layoutItems>
                <behavior>Edit</behavior>
                <field>OwnerId</field>
            </layoutItems>{extra_fields_left}
        </layoutColumns>
        <layoutColumns>
            <layoutItems>
                <behavior>Readonly</behavior>
                <field>CreatedById</field>
            </layoutItems>
            <layoutItems>
                <behavior>Readonly</behavior>
                <field>LastModifiedById</field>
            </layoutItems>{extra_fields_right}
        </layoutColumns>
        <style>TwoColumnsTopToBottom</style>
    </layoutSections>
    <layoutSections>
        <customLabel>true</customLabel>
        <detailHeading>true</detailHeading>
        <editHeading>true</editHeading>
        <label>System Information</label>
        <layoutColumns>
            <layoutItems>
                <behavior>Readonly</behavior>
                <field>CreatedDate</field>
            </layoutItems>
        </layoutColumns>
        <layoutColumns>
            <layoutItems>
                <behavior>Readonly</behavior>
                <field>LastModifiedDate</field>
            </layoutItems>
        </layoutColumns>
        <style>TwoColumnsTopToBottom</style>
    </layoutSections>
    <showEmailCheckbox>false</showEmailCheckbox>
    <showHighlightsPanel>true</showHighlightsPanel>
    <showInteractionLogPanel>true</showInteractionLogPanel>
    <showRunAssignmentRulesCheckbox>false</showRunAssignmentRulesCheckbox>
    <showSubmitAndAttachButton>false</showSubmitAndAttachButton>
</Layout>
'''

FLOW_TEMPLATE = '''<?xml version="1.0" encoding="UTF-8"?>
<Flow xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>59.0</apiVersion>
    <description>Automated flow for {label} processing and validation</description>
    <environments>Default</environments>
    <interviewLabel>{label} {{!$Flow.CurrentDateTime}}</interviewLabel>
    <label>{label}</label>
    <processMetadataValues>
        <name>BuilderType</name>
        <value><stringValue>LightningFlowBuilder</stringValue></value>
    </processMetadataValues>
    <processMetadataValues>
        <name>CanvasMode</name>
        <value><stringValue>AUTO_LAYOUT_CANVAS</stringValue></value>
    </processMetadataValues>
    <processMetadataValues>
        <name>OriginBuilderId</name>
        <value><stringValue>{flow_id}</stringValue></value>
    </processMetadataValues>
    <processType>AutoLaunchedFlow</processType>
    <recordCreates>
        <name>Create_Record</name>
        <label>Create Record</label>
        <locationX>176</locationX>
        <locationY>311</locationY>
        <inputAssignments>
            <field>Name</field>
            <value><stringValue>Auto Generated</stringValue></value>
        </inputAssignments>
        <object>{obj_api}</object>
    </recordCreates>
    <start>
        <locationX>50</locationX>
        <locationY>0</locationY>
        <connector>
            <targetReference>Create_Record</targetReference>
        </connector>
        <object>{obj_api}</object>
        <recordTriggerType>Create</recordTriggerType>
        <triggerType>RecordAfterSave</triggerType>
    </start>
    <status>Draft</status>
    <variables>
        <name>recordId</name>
        <dataType>String</dataType>
        <isCollection>false</isCollection>
        <isInput>true</isInput>
        <isOutput>false</isOutput>
    </variables>
</Flow>
'''

TAB_TEMPLATE = '''<?xml version="1.0" encoding="UTF-8"?>
<CustomTab xmlns="http://soap.sforce.com/2006/04/metadata">
    <customObject>true</customObject>
    <motif>Custom68: Wrench</motif>
</CustomTab>
'''

def generate():
    total_bytes = 0
    total_files = 0
    random.seed(42)

    obj_names = set()
    for d in DOMAINS:
        for s in SUFFIXES:
            obj_names.add((d, s))
    obj_list = sorted(obj_names)
    random.shuffle(obj_list)
    obj_list = obj_list[:NUM_OBJECTS]

    print(f"Generating {len(obj_list)} custom objects with ~{FIELDS_PER_OBJECT} fields each...")
    print(f"Target: ~{TARGET_BYTES/1e9:.1f} GB\n")

    for obj_idx, (domain, suffix) in enumerate(obj_list):
        obj_api = f"{domain}_{suffix}__c"
        obj_label = f"{domain} {suffix}"

        content = build_object_xml(obj_label, FIELDS_PER_OBJECT)
        obj_file = os.path.join(OBJECTS_DIR, f"{obj_api}.object")
        with open(obj_file, "w") as f:
            f.write(content)
        total_bytes += len(content.encode())
        total_files += 1

        layout_fields_left = ""
        layout_fields_right = ""
        for fi in range(min(10, FIELDS_PER_OBJECT)):
            base = FIELD_NAMES[fi % len(FIELD_NAMES)]
            api = f"{base}__c"
            item = f"""
            <layoutItems>
                <behavior>Edit</behavior>
                <field>{api}</field>
            </layoutItems>"""
            if fi % 2 == 0:
                layout_fields_left += item
            else:
                layout_fields_right += item

        layout_content = LAYOUT_TEMPLATE.format(
            extra_fields_left=layout_fields_left,
            extra_fields_right=layout_fields_right,
        )
        layout_file = os.path.join(LAYOUTS_DIR, f"{obj_api}-{obj_api.replace('__c', '')} Layout.layout")
        with open(layout_file, "w") as f:
            f.write(layout_content)
        total_bytes += len(layout_content.encode())
        total_files += 1

        tab_file = os.path.join(TABS_DIR, f"{obj_api}.tab")
        with open(tab_file, "w") as f:
            f.write(TAB_TEMPLATE)
        total_bytes += len(TAB_TEMPLATE.encode())
        total_files += 1

        flow_content = FLOW_TEMPLATE.format(
            label=f"{obj_label} Auto Process",
            flow_id=f"flow_{domain}_{suffix}_{obj_idx}",
            obj_api=obj_api,
        )
        flow_file = os.path.join(FLOWS_DIR, f"{domain}_{suffix}_Auto_Process.flow-meta.xml")
        with open(flow_file, "w") as f:
            f.write(flow_content)
        total_bytes += len(flow_content.encode())
        total_files += 1

        qa_content = f'''<?xml version="1.0" encoding="UTF-8"?>
<QuickAction xmlns="http://soap.sforce.com/2006/04/metadata">
    <label>New {obj_label}</label>
    <optionsCreateFeedItem>true</optionsCreateFeedItem>
    <quickActionLayout>
        <layoutSectionStyle>TwoColumnsLeftToRight</layoutSectionStyle>
        <quickActionLayoutColumns>
            <quickActionLayoutItems>
                <emptySpace>false</emptySpace>
                <field>Name</field>
                <uiBehavior>Required</uiBehavior>
            </quickActionLayoutItems>
        </quickActionLayoutColumns>
    </quickActionLayout>
    <type>Create</type>
</QuickAction>
'''
        qa_file = os.path.join(QUICK_ACTIONS_DIR, f"{obj_api}.New_{domain}_{suffix}.quickAction")
        with open(qa_file, "w") as f:
            f.write(qa_content)
        total_bytes += len(qa_content.encode())
        total_files += 1

        for pattern in ["Service", "Controller", "Handler"]:
            cls_name = f"{domain}{suffix}{pattern}"
            cls_content = CLS_TEMPLATE.format(name=cls_name)
            cls_file = os.path.join(CLASSES_DIR, f"{cls_name}.cls")
            meta_file = os.path.join(CLASSES_DIR, f"{cls_name}.cls-meta.xml")
            with open(cls_file, "w") as f:
                f.write(cls_content)
            with open(meta_file, "w") as f:
                f.write(CLS_META)
            total_bytes += len(cls_content.encode()) + len(CLS_META.encode())
            total_files += 2

        trigger_name = f"{domain}{suffix}Trigger"
        handler_name = f"{domain}{suffix}Handler"
        trig_content = TRIGGER_TEMPLATE.format(name=trigger_name, obj=obj_api, handler=handler_name)
        trig_file = os.path.join(TRIGGERS_DIR, f"{trigger_name}.trigger")
        trig_meta_file = os.path.join(TRIGGERS_DIR, f"{trigger_name}.trigger-meta.xml")
        with open(trig_file, "w") as f:
            f.write(trig_content)
        with open(trig_meta_file, "w") as f:
            f.write(TRIGGER_META)
        total_bytes += len(trig_content.encode()) + len(TRIGGER_META.encode())
        total_files += 2

        page_name = f"{domain}{suffix}Page"
        page_content = PAGE_TEMPLATE.format(
            controller=f"{domain}{suffix}Controller",
            title=obj_label,
        )
        page_meta_content = PAGE_META.format(label=obj_label)
        page_file = os.path.join(PAGES_DIR, f"{page_name}.page")
        page_meta_file = os.path.join(PAGES_DIR, f"{page_name}.page-meta.xml")
        with open(page_file, "w") as f:
            f.write(page_content)
        with open(page_meta_file, "w") as f:
            f.write(page_meta_content)
        total_bytes += len(page_content.encode()) + len(page_meta_content.encode())
        total_files += 2

        if (obj_idx + 1) % 100 == 0:
            pct = total_bytes / TARGET_BYTES * 100
            print(f"  [{obj_idx+1}/{NUM_OBJECTS}] {total_files:,} files, {total_bytes/1e6:.0f} MB ({pct:.1f}%)")

    print(f"\nDone: {total_files:,} files, {total_bytes/1e6:.0f} MB ({total_bytes/1e9:.2f} GB)")

if __name__ == "__main__":
    generate()
