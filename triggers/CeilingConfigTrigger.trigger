trigger CeilingConfigTrigger on Ceiling_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingConfigHandler.handleAfterDelete(Trigger.old);
    }
}
