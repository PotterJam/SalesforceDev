trigger AlertTriggerTrigger on Alert_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
