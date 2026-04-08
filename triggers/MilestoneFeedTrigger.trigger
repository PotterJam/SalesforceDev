trigger MilestoneFeedTrigger on Milestone_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneFeedHandler.handleAfterDelete(Trigger.old);
    }
}
