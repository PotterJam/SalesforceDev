trigger SalesHubTrigger on Sales_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesHubHandler.handleAfterDelete(Trigger.old);
    }
}
