trigger BenchmarkEndpointTrigger on Benchmark_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
