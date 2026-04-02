trigger BenchmarkRouteTrigger on Benchmark_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkRouteHandler.handleAfterDelete(Trigger.old);
    }
}
