trigger DurationLinkTrigger on Duration_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationLinkHandler.handleAfterDelete(Trigger.old);
    }
}
