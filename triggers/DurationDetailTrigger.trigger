trigger DurationDetailTrigger on Duration_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationDetailHandler.handleAfterDelete(Trigger.old);
    }
}
