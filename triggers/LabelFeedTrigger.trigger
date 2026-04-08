trigger LabelFeedTrigger on Label_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelFeedHandler.handleAfterDelete(Trigger.old);
    }
}
