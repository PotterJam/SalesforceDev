trigger ResourceFeedTrigger on Resource_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceFeedHandler.handleAfterDelete(Trigger.old);
    }
}
