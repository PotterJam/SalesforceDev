trigger ScheduleRuleTrigger on Schedule_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleRuleHandler.handleAfterDelete(Trigger.old);
    }
}
