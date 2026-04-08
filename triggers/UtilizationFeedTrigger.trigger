trigger UtilizationFeedTrigger on Utilization_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationFeedHandler.handleAfterDelete(Trigger.old);
    }
}
