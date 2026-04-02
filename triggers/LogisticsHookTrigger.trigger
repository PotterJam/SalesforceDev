trigger LogisticsHookTrigger on Logistics_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsHookHandler.handleAfterDelete(Trigger.old);
    }
}
