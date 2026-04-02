trigger LogisticsQueueTrigger on Logistics_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsQueueHandler.handleAfterDelete(Trigger.old);
    }
}
