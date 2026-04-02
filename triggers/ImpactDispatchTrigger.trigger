trigger ImpactDispatchTrigger on Impact_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
