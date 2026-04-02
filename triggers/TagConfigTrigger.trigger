trigger TagConfigTrigger on Tag_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagConfigHandler.handleAfterDelete(Trigger.old);
    }
}
