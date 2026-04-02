trigger PriorityLinkTrigger on Priority_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityLinkHandler.handleAfterDelete(Trigger.old);
    }
}
