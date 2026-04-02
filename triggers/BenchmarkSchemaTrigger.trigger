trigger BenchmarkSchemaTrigger on Benchmark_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
