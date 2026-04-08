trigger DurationActionTrigger on Duration_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationActionHandler.handleAfterDelete(Trigger.old);
    }
}
