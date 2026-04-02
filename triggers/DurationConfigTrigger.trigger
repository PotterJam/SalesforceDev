trigger DurationConfigTrigger on Duration_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationConfigHandler.handleAfterDelete(Trigger.old);
    }
}
