trigger IssueLinkTrigger on Issue_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueLinkHandler.handleAfterDelete(Trigger.old);
    }
}
