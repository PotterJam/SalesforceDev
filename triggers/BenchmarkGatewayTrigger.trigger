trigger BenchmarkGatewayTrigger on Benchmark_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
