trigger ResourceLinkTrigger on Resource_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceLinkHandler.handleAfterDelete(Trigger.old);
    }
}
