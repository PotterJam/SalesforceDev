trigger TagEventTrigger on Tag_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagEventHandler.handleAfterDelete(Trigger.old);
    }
}
