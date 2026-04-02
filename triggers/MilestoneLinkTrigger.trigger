trigger MilestoneLinkTrigger on Milestone_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneLinkHandler.handleAfterDelete(Trigger.old);
    }
}
