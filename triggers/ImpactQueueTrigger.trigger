trigger ImpactQueueTrigger on Impact_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactQueueHandler.handleAfterDelete(Trigger.old);
    }
}
