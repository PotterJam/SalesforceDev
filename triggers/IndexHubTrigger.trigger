trigger IndexHubTrigger on Index_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexHubHandler.handleAfterDelete(Trigger.old);
    }
}
