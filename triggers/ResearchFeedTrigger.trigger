trigger ResearchFeedTrigger on Research_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchFeedHandler.handleAfterDelete(Trigger.old);
    }
}
