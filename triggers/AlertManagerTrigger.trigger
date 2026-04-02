trigger AlertManagerTrigger on Alert_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertManagerHandler.handleAfterDelete(Trigger.old);
    }
}
