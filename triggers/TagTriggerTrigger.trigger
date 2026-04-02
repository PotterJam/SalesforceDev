trigger TagTriggerTrigger on Tag_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
