trigger BenchmarkPluginTrigger on Benchmark_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkPluginHandler.handleAfterDelete(Trigger.old);
    }
}
