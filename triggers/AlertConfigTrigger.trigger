trigger AlertConfigTrigger on Alert_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertConfigHandler.handleAfterDelete(Trigger.old);
    }
}
