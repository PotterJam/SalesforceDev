trigger LogisticsActionTrigger on Logistics_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsActionHandler.handleAfterDelete(Trigger.old);
    }
}
