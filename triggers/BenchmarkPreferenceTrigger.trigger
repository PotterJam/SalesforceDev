trigger BenchmarkPreferenceTrigger on Benchmark_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
