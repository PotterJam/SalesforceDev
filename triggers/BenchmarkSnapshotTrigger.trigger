trigger BenchmarkSnapshotTrigger on Benchmark_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
