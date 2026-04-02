trigger QualityFeedTrigger on Quality_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityFeedHandler.handleAfterDelete(Trigger.old);
    }
}
