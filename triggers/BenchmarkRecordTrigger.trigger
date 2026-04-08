trigger BenchmarkRecordTrigger on Benchmark_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkRecordHandler.handleAfterDelete(Trigger.old);
    }
}
