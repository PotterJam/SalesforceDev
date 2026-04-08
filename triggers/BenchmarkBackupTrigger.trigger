trigger BenchmarkBackupTrigger on Benchmark_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkBackupHandler.handleAfterDelete(Trigger.old);
    }
}
