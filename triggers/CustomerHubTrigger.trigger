trigger CustomerHubTrigger on Customer_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerHubHandler.handleAfterDelete(Trigger.old);
    }
}
