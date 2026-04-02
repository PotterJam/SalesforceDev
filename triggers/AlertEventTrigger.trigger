trigger AlertEventTrigger on Alert_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertEventHandler.handleAfterDelete(Trigger.old);
    }
}
