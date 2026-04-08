trigger DurationViewTrigger on Duration_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationViewHandler.handleAfterDelete(Trigger.old);
    }
}
