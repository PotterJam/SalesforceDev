trigger BenchmarkAuditTrigger on Benchmark_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkAuditHandler.handleAfterDelete(Trigger.old);
    }
}
