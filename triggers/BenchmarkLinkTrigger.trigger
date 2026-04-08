trigger BenchmarkLinkTrigger on Benchmark_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkLinkHandler.handleAfterDelete(Trigger.old);
    }
}
