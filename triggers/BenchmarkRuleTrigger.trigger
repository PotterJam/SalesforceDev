trigger BenchmarkRuleTrigger on Benchmark_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkRuleHandler.handleAfterDelete(Trigger.old);
    }
}
