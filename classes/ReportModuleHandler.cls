public with sharing class ReportModuleHandler {

    private static final String LOG_PREFIX = 'ReportModuleHandler';
    private static final Integer MAX_RETRIES = 3;
    private static final Integer BATCH_SIZE = 200;

    private List<SObject> records;
    private Map<Id, SObject> recordMap;
    private Set<Id> processedIds;
    private Boolean isInitialized;

    public ReportModuleHandler() {
        this.records = new List<SObject>();
        this.recordMap = new Map<Id, SObject>();
        this.processedIds = new Set<Id>();
        this.isInitialized = false;
    }

    public ReportModuleHandler(List<SObject> inputRecords) {
        this();
        this.records = inputRecords;
        this.isInitialized = true;
    }

    public void initialize(List<SObject> inputRecords) {
        if (this.isInitialized) return;
        this.records = inputRecords;
        for (SObject rec : inputRecords) {
            if (rec.Id != null) this.recordMap.put(rec.Id, rec);
        }
        this.isInitialized = true;
    }

    public List<SObject> execute() {
        if (!this.isInitialized) throw new ReportModuleHandlerException('Not initialized');
        List<SObject> results = new List<SObject>();
        for (SObject rec : this.records) {
            if (rec != null) {
                results.add(rec);
                if (rec.Id != null) this.processedIds.add(rec.Id);
            }
        }
        return results;
    }

    public Set<Id> getProcessedIds() { return this.processedIds; }
    public Boolean isReady() { return this.isInitialized; }
    public class ReportModuleHandlerException extends Exception {}
}
