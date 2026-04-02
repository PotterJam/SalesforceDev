trigger BenchmarkTrackerTrigger on Benchmark_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
