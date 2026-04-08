trigger BenchmarkTemplateTrigger on Benchmark_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
